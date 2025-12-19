terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "random_string" "suffix" {
  length  = 8
  upper   = false
  special = false
}

locals {
  unique_id      = random_string.suffix.result
  rg_name        = "rg-${var.prefix}-${local.unique_id}"
  ssh_public_key = file(var.ssh_public_key_path)
}

# 55. Resource Group
module "resource_group" {
  source = "./modules/avm-res-resources-resourcegroup"

  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

# 1. Virtual Network
module "virtual_network" {
  source = "./modules/avm-res-network-virtualnetwork"

  name                = "${var.prefix}-vnet"
  location            = var.location
  resource_group_name = module.resource_group.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["8.8.8.8"]
  tags                = var.tags
}

# 2. Storage Account
module "storage_account" {
  source = "./modules/avm-res-storage-storageaccount"

  name                     = lower("${var.prefix}stor${local.unique_id}")
  resource_group_name      = module.resource_group.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_kind             = "StorageV2"
  access_tier              = "Hot"
  tags                     = var.tags
}

# 3. Key Vault
module "key_vault" {
  source = "./modules/avm-res-keyvault-vault"

  name                     = "${var.prefix}-kv-${local.unique_id}"
  location                 = var.location
  resource_group_name      = module.resource_group.name
  tenant_id                = data.azurerm_client_config.current.tenant_id
  sku_name                 = "standard"
  purge_protection_enabled = false
  tags                     = var.tags
}

# 4. Virtual Machine
module "virtual_machine" {
  source = "./modules/avm-res-compute-virtualmachine"

  name                  = "${var.prefix}-vm"
  location              = var.location
  resource_group_name   = module.resource_group.name
  vm_size               = "Standard_D2s_v3"
  admin_username        = var.admin_username
  ssh_public_key        = local.ssh_public_key
  network_interface_ids = [] # In real scenarios create NIC separately
  os_type               = "Linux"
  storage_account_type  = "Premium_LRS"
  image_publisher       = "Canonical"
  image_offer           = "UbuntuServer"
  image_sku             = "18.04-LTS"
  image_version         = "latest"
  tags                  = var.tags
}

# 5. AKS Cluster
module "aks" {
  source = "./modules/avm-res-containerservice-managedcluster"

  name                = "${var.prefix}-aks"
  location            = var.location
  resource_group_name = module.resource_group.name
  dns_prefix          = lower("${var.prefix}-aks")
  node_count          = 2
  vm_size             = "Standard_DS3_v2"
  tags                = var.tags
}

# 6. Web App
module "web_app" {
  source = "./modules/avm-res-web-site"

  name                = "${var.prefix}app${local.unique_id}"
  location            = var.location
  resource_group_name = module.resource_group.name
  service_plan_id     = azurerm_app_service_plan.example.id # create plan separately in production
  always_on           = true
  tags                = var.tags
}

# 7. Log Analytics Workspace
module "log_analytics" {
  source = "./modules/avm-res-operationalinsights-workspace"

  name                = "${var.prefix}-log"
  location            = var.location
  resource_group_name = module.resource_group.name
  sku                 = "PerGB2018"
  retention_in_days   = 90
  tags                = var.tags
}

# 8. Network Security Group
module "nsg" {
  source = "./modules/avm-res-network-networksecuritygroup"

  name                = "${var.prefix}-nsg"
  location            = var.location
  resource_group_name = module.resource_group.name
  security_rules      = []
  tags                = var.tags
}

# 9. User-Assigned Managed Identity
module "managed_identity" {
  source = "./modules/avm-res-managedidentity-userassignedidentity"

  name                = "${var.prefix}-id"
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

# 10. Container Registry
module "acr" {
  source = "./modules/avm-res-containerregistry-registry"

  name                    = lower("${var.prefix}acr${local.unique_id}")
  location                = var.location
  resource_group_name     = module.resource_group.name
  sku                     = "Premium"
  admin_enabled           = true
  zone_redundancy_enabled = true
  tags                    = var.tags
}

# 11. Public IP Address
module "public_ip" {
  source = "./modules/avm-res-network-publicipaddress"

  name                = "${var.prefix}-pip"
  location            = var.location
  resource_group_name = module.resource_group.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

# 12. Bastion Host
module "bastion" {
  source = "./modules/avm-res-network-bastionhost"

  name                 = "${var.prefix}-bastion"
  location             = var.location
  resource_group_name  = module.resource_group.name
  subnet_id            = "placeholder-bastion-subnet-id" # replace with actual AzureBastionSubnet
  public_ip_address_id = module.public_ip.id
  sku                  = "Standard"
  scale_units          = 2
  tags                 = var.tags
}

# 13. Load Balancer
module "load_balancer" {
  source = "./modules/avm-res-network-loadbalancer"

  name                = "${var.prefix}-lb"
  location            = var.location
  resource_group_name = module.resource_group.name
  sku                 = "Standard"
  tags                = var.tags
}

# 14. Redis Cache
module "redis" {
  source = "./modules/avm-res-cache-redis"

  name                = "${var.prefix}-redis"
  location            = var.location
  resource_group_name = module.resource_group.name
  capacity            = 1
  family              = "C"
  sku_name            = "Standard"
  maxmemory_reserved  = 10
  maxmemory_policy    = "volatile-lru"
  tags                = var.tags
}

# 15. PostgreSQL Flexible Server
module "postgresql" {
  source = "./modules/avm-res-dbforpostgresql-flexibleserver"

  name                   = "${var.prefix}-psql"
  location               = var.location
  resource_group_name    = module.resource_group.name
  postgresql_version     = "15"
  administrator_login    = var.admin_username
  administrator_password = var.admin_password
  zone                   = "1"
  storage_mb             = 32768
  sku_name               = "GP_Standard_D2s_v3"
  tags                   = var.tags
}

# 16. MySQL Flexible Server
module "mysql" {
  source = "./modules/avm-res-dbformysql-flexibleserver"

  name                   = "${var.prefix}-mysql"
  location               = var.location
  resource_group_name    = module.resource_group.name
  mysql_version          = "8.0.21"
  administrator_login    = var.admin_username
  administrator_password = var.admin_password
  zone                   = "1"
  storage_size_gb        = 32
  sku_name               = "GP_Standard_D2ds_v4"
  tags                   = var.tags
}

# 17. Databricks Workspace
module "databricks" {
  source = "./modules/avm-res-databricks-workspace"

  name                = "${var.prefix}-dbw"
  location            = var.location
  resource_group_name = module.resource_group.name
  sku                 = "premium"
  tags                = var.tags
}

# 18. Virtual Machine Scale Set
module "vmss" {
  source = "./modules/avm-res-compute-virtualmachinescaleset"

  name                = "${var.prefix}-vmss"
  location            = var.location
  resource_group_name = module.resource_group.name
  vm_size             = "Standard_D2s_v3"
  instance_count      = 2
  admin_username      = var.admin_username
  ssh_public_key      = local.ssh_public_key
  subnet_id           = "placeholder-subnet-id"
  storage_account_type = "Standard_LRS"
  image_publisher     = "Canonical"
  image_offer         = "UbuntuServer"
  image_sku           = "18.04-LTS"
  tags                = var.tags
}

# 19. Container App
module "container_app" {
  source = "./modules/avm-res-app-containerapp"

  name                         = "${var.prefix}-ca"
  location                     = var.location
  resource_group_name          = module.resource_group.name
  container_app_environment_id = "placeholder-env-id" # create environment separately
  container_name               = "app"
  container_image              = "nginx:latest"
  cpu                          = 0.5
  memory                       = "1Gi"
  tags                         = var.tags
}

# 20. Role Assignment
module "role_assignment" {
  source = "./modules/avm-res-authorization-roleassignment"

  scope                = module.resource_group.id
  role_definition_name = "Contributor"
  principal_id         = module.managed_identity.principal_id
}

# 21. Azure Firewall
module "azure_firewall" {
  source = "./modules/avm-res-network-azurefirewall"

  name                = "${var.prefix}-fw"
  location            = var.location
  resource_group_name = module.resource_group.name
  subnet_id           = "placeholder-firewall-subnet-id"
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"
  tags                = var.tags
}

# 22. Private DNS Zone
module "private_dns_zone" {
  source = "./modules/avm-res-network-privatednszone"

  name                = "privatelink.blob.core.windows.net"
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

# 23. Cognitive Services Account
module "cognitive_services" {
  source = "./modules/avm-res-cognitiveservices-account"

  name                = "${var.prefix}-cog"
  location            = var.location
  resource_group_name = module.resource_group.name
  kind                = "CognitiveServices"
  sku_name            = "S0"
  tags                = var.tags
}

# 24. Service Bus Namespace
module "servicebus" {
  source = "./modules/avm-res-servicebus-namespace"

  name                = "${var.prefix}-sb-${local.unique_id}"
  location            = var.location
  resource_group_name = module.resource_group.name
  sku                 = "Standard"
  capacity            = 1
  tags                = var.tags
}

# 25. Event Hub Namespace
module "eventhub_namespace" {
  source = "./modules/avm-res-eventhub-namespace"

  name                = "${var.prefix}-eh-${local.unique_id}"
  location            = var.location
  resource_group_name = module.resource_group.name
  sku                 = "Standard"
  capacity            = 1
  tags                = var.tags
}

# 26. Cosmos DB Account
module "cosmosdb" {
  source = "./modules/avm-res-documentdb-databaseaccount"

  name                = "${var.prefix}-cosmos-${local.unique_id}"
  location            = var.location
  resource_group_name = module.resource_group.name
  kind                = "GlobalDocumentDB"
  consistency_level   = "Session"
  tags                = var.tags
}

# 27. Data Factory
module "data_factory" {
  source = "./modules/avm-res-datafactory-factory"

  name                = "${var.prefix}-adf"
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

# 28. Batch Account
module "batch_account" {
  source = "./modules/avm-res-batch-batchaccount"

  name                = "${var.prefix}-batch"
  location            = var.location
  resource_group_name = module.resource_group.name
  storage_account_id  = module.storage_account.id
  tags                = var.tags
}

# 29. CDN Profile
module "cdn_profile" {
  source = "./modules/avm-res-cdn-profile"

  name                = "${var.prefix}-cdn"
  location            = var.location
  resource_group_name = module.resource_group.name
  sku                 = "Standard_Microsoft"
  tags                = var.tags
}

# 30. Container Apps Environment
module "container_app_env" {
  source = "./modules/avm-res-app-managedenvironment"

  name                = "${var.prefix}-cae"
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

# 31. Managed Disk
module "managed_disk" {
  source = "./modules/avm-res-compute-disk"

  name                 = "${var.prefix}-disk"
  location             = var.location
  resource_group_name  = module.resource_group.name
  storage_account_type = "Premium_LRS"
  disk_size_gb         = 128
  tags                 = var.tags
}

# 32. Route Table
module "route_table" {
  source = "./modules/avm-res-network-routetable"

  name                = "${var.prefix}-rt"
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

# 33. AVD Host Pool
module "avd_host_pool" {
  source = "./modules/avm-res-desktopvirtualization-hostpool"

  name               = "${var.prefix}-hostpool"
  location           = var.location
  resource_group_name = module.resource_group.name
  type               = "Pooled"
  load_balancer_type = "BreadthFirst"
  tags               = var.tags
}

# 34. AVD Workspace
module "avd_workspace" {
  source = "./modules/avm-res-desktopvirtualization-workspace"

  name                = "${var.prefix}-workspace"
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

# 35. AVD Application Group
module "avd_app_group" {
  source = "./modules/avm-res-desktopvirtualization-applicationgroup"

  name         = "${var.prefix}-appgroup"
  location     = var.location
  resource_group_name = module.resource_group.name
  type         = "Desktop"
  host_pool_id = module.avd_host_pool.id
  tags         = var.tags
}

# 36. Application Insights
module "application_insights" {
  source = "./modules/avm-res-insights-component"

  name                = "${var.prefix}-appinsights"
  location            = var.location
  resource_group_name = module.resource_group.name
  application_type    = "web"
  retention_in_days   = 90
  tags                = var.tags
}

# 37. Data Explorer Cluster (Kusto)
module "kusto_cluster" {
  source = "./modules/avm-res-kusto-cluster"

  name             = "${var.prefix}-kusto"
  location         = var.location
  resource_group_name = module.resource_group.name
  sku_name         = "Dev(No SLA)_Standard_D11_v2"
  sku_capacity     = 1
  tags             = var.tags
}

# 38. NAT Gateway
module "nat_gateway" {
  source = "./modules/avm-res-network-natgateway"

  name                = "${var.prefix}-nat"
  location            = var.location
  resource_group_name = module.resource_group.name
  public_ip_names     = ["${var.prefix}-nat-pip"]
  tags                = var.tags
}

# 39. DDoS Protection Plan
module "ddos_plan" {
  source = "./modules/avm-res-network-ddosprotectionplan"

  name                = "${var.prefix}-ddos"
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

# 40. Automation Account
module "automation_account" {
  source = "./modules/avm-res-automation-automationaccount"

  name                = "${var.prefix}-auto"
  location            = var.location
  resource_group_name = module.resource_group.name
  sku_name            = "Basic"
  tags                = var.tags
}

# 41. Backup Vault
module "backup_vault" {
  source = "./modules/avm-res-dataprotection-backupvault"

  name                = "${var.prefix}-backup"
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

# 42. Communication Services
module "communication_service" {
  source = "./modules/avm-res-communication-emailservice"

  name          = "${var.prefix}-comm"
  location      = var.location
  resource_group_name = module.resource_group.name
  data_location = "United States"
  tags          = var.tags
}

# 43. App Configuration
module "app_config" {
  source = "./modules/avm-res-appconfiguration-configurationstore"

  name                = "${var.prefix}-appconfig"
  location            = var.location
  resource_group_name = module.resource_group.name
  sku                 = "standard"
  tags                = var.tags
}

# 44. Container Instance Group
module "container_group" {
  source = "./modules/avm-res-containerinstance-containergroup"

  name            = "${var.prefix}-aci"
  location        = var.location
  resource_group_name = module.resource_group.name
  os_type         = "Linux"
  restart_policy  = "Always"
  container_name  = "hello"
  container_image = "mcr.microsoft.com/azuredocs/aci-helloworld"
  cpu             = 1
  memory          = 1.5
  container_port  = 80
  tags            = var.tags
}

# 45. Firewall Policy
module "firewall_policy" {
  source = "./modules/avm-res-network-firewallpolicy"

  name                = "${var.prefix}-fwpolicy"
  location            = var.location
  resource_group_name = module.resource_group.name
  sku                 = "Standard"
  tags                = var.tags
}

# 46. Compute Gallery
module "compute_gallery" {
  source = "./modules/avm-res-compute-gallery"

  name                = "${var.prefix}-gallery"
  location            = var.location
  resource_group_name = module.resource_group.name
  description         = "Shared image gallery"
  tags                = var.tags
}

# 47. SSH Public Key
module "ssh_key" {
  source = "./modules/avm-res-compute-sshpublickey"

  name                = "${var.prefix}-sshkey"
  location            = var.location
  resource_group_name = module.resource_group.name
  public_key          = local.ssh_public_key
  tags                = var.tags
}

# 48. Logic App Workflow
module "logic_app" {
  source = "./modules/avm-res-logic-workflow"

  name                = "${var.prefix}-logic"
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

# 49. Static Web App
module "static_site" {
  source = "./modules/avm-res-web-staticsite"

  name                = "${var.prefix}-static"
  location            = var.location
  resource_group_name = module.resource_group.name
  sku_tier            = "Standard"
  sku_size            = "Standard"
  tags                = var.tags
}

# 50. Machine Learning Workspace
module "ml_workspace" {
  source = "./modules/avm-res-machinelearningservices-workspace"

  name                    = "${var.prefix}-ml"
  location                = var.location
  resource_group_name     = module.resource_group.name
  application_insights_id = module.application_insights.id
  key_vault_id            = module.key_vault.id
  storage_account_id      = module.storage_account.id
  container_registry_id   = module.acr.id
  tags                    = var.tags
}

# 51. Network Watcher
module "network_watcher" {
  source = "./modules/avm-res-network-networkwatcher"

  name                = "NetworkWatcher_${var.location}"
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

# 52. Backup Resource Guard
module "resource_guard" {
  source = "./modules/avm-res-dataprotection-resourceguard"

  name                = "${var.prefix}-guard"
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

# 53. DNS Resolver
module "dns_resolver" {
  source = "./modules/avm-res-network-dnsresolver"

  name               = "${var.prefix}-dnsresolver"
  location           = var.location
  resource_group_name = module.resource_group.name
  virtual_network_id = module.virtual_network.id
  tags               = var.tags
}

# 54. Azure VMware Solution Private Cloud
module "avs_private_cloud" {
  source = "./modules/avm-res-avs-privatecloud"

  name                = "${var.prefix}-avs"
  location            = var.location
  resource_group_name = module.resource_group.name
  sku_name            = "av36"
  cluster_size        = 3
  network_subnet_cidr = "192.168.0.0/22"
  tags                = var.tags
}

# Dummy App Service Plan for Web App example (required for module.web_app)
resource "azurerm_app_service_plan" "example" {
  name                = "${var.prefix}-plan"
  location            = var.location
  resource_group_name = module.resource_group.name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Standard"
    size = "S1"
  }
}
