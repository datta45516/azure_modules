# outputs.tf - Root module outputs for all 55 AVM-style modules

output "resource_group_name" {
  description = "Name of the created resource group"
  value       = module.resource_group.name
}

output "resource_group_id" {
  description = "ID of the created resource group"
  value       = module.resource_group.id
}

output "resource_group_location" {
  description = "Location of the created resource group"
  value       = module.resource_group.location
}

# 1. Virtual Network
output "virtual_network_id" {
  description = "ID of the Virtual Network"
  value       = module.virtual_network.id
}

output "virtual_network_name" {
  description = "Name of the Virtual Network"
  value       = module.virtual_network.name
}

# 2. Storage Account
output "storage_account_id" {
  description = "ID of the Storage Account"
  value       = module.storage_account.id
}

output "storage_account_primary_blob_endpoint" {
  description = "Primary blob endpoint of the Storage Account"
  value       = module.storage_account.primary_blob_endpoint
}

# 3. Key Vault
output "key_vault_id" {
  description = "ID of the Key Vault"
  value       = module.key_vault.id
}

output "key_vault_uri" {
  description = "URI of the Key Vault"
  value       = module.key_vault.vault_uri
}

# 4. Virtual Machine
output "virtual_machine_id" {
  description = "ID of the Virtual Machine"
  value       = module.virtual_machine.id
}

# 5. AKS Cluster
output "aks_cluster_id" {
  description = "ID of the AKS Cluster"
  value       = module.aks.id
}

output "aks_kube_config_raw" {
  description = "Raw kubeconfig for the AKS cluster (sensitive)"
  value       = module.aks.kube_config_raw
  sensitive   = true
}

# 6. Web App
output "web_app_id" {
  description = "ID of the Web App"
  value       = module.web_app.id
}

output "web_app_default_hostname" {
  description = "Default hostname of the Web App"
  value       = module.web_app.default_hostname
}

# 7. Log Analytics Workspace
output "log_analytics_workspace_id" {
  description = "ID of the Log Analytics Workspace"
  value       = module.log_analytics.id
}

output "log_analytics_workspace_workspace_id" {
  description = "Workspace ID (GUID) of Log Analytics"
  value       = module.log_analytics.workspace_id
}

# 8. Network Security Group
output "nsg_id" {
  description = "ID of the Network Security Group"
  value       = module.nsg.id
}

# 9. Managed Identity
output "managed_identity_id" {
  description = "ID of the User-Assigned Managed Identity"
  value       = module.managed_identity.id
}

output "managed_identity_principal_id" {
  description = "Principal ID of the Managed Identity"
  value       = module.managed_identity.principal_id
}

output "managed_identity_client_id" {
  description = "Client ID of the Managed Identity"
  value       = module.managed_identity.client_id
}

# 10. Container Registry
output "acr_id" {
  description = "ID of the Azure Container Registry"
  value       = module.acr.id
}

output "acr_login_server" {
  description = "Login server of the ACR"
  value       = module.acr.login_server
}

# 11. Public IP
output "public_ip_id" {
  description = "ID of the Public IP Address"
  value       = module.public_ip.id
}

output "public_ip_address" {
  description = "Allocated IP address"
  value       = module.public_ip.ip_address
}

# 12. Bastion Host
output "bastion_id" {
  description = "ID of the Azure Bastion Host"
  value       = module.bastion.id
}

# 13. Load Balancer
output "load_balancer_id" {
  description = "ID of the Load Balancer"
  value       = module.load_balancer.id
}

# 14. Redis Cache
output "redis_id" {
  description = "ID of the Redis Cache"
  value       = module.redis.id
}

output "redis_hostname" {
  description = "Hostname of the Redis instance"
  value       = module.redis.hostname
}

# 15. PostgreSQL Flexible Server
output "postgresql_id" {
  description = "ID of the PostgreSQL Flexible Server"
  value       = module.postgresql.id
}

output "postgresql_fqdn" {
  description = "FQDN of the PostgreSQL server"
  value       = module.postgresql.fqdn
}

# 16. MySQL Flexible Server
output "mysql_id" {
  description = "ID of the MySQL Flexible Server"
  value       = module.mysql.id
}

output "mysql_fqdn" {
  description = "FQDN of the MySQL server"
  value       = module.mysql.fqdn
}

# 17. Databricks Workspace
output "databricks_workspace_id" {
  description = "ID of the Databricks Workspace"
  value       = module.databricks.id
}

output "databricks_workspace_url" {
  description = "Workspace URL"
  value       = module.databricks.workspace_url
}

# 18. Virtual Machine Scale Set
output "vmss_id" {
  description = "ID of the Virtual Machine Scale Set"
  value       = module.vmss.id
}

# 19. Container App
output "container_app_id" {
  description = "ID of the Container App"
  value       = module.container_app.id
}

output "container_app_fqdn" {
  description = "FQDN of the Container App"
  value       = module.container_app.fqdn
}

# 20. Role Assignment
output "role_assignment_id" {
  description = "ID of the Role Assignment"
  value       = module.role_assignment.id
}

# 21. Azure Firewall
output "azure_firewall_id" {
  description = "ID of the Azure Firewall"
  value       = module.azure_firewall.id
}

# 22. Private DNS Zone
output "private_dns_zone_id" {
  description = "ID of the Private DNS Zone"
  value       = module.private_dns_zone.id
}

# 23. Cognitive Services
output "cognitive_services_id" {
  description = "ID of the Cognitive Services Account"
  value       = module.cognitive_services.id
}

output "cognitive_services_endpoint" {
  description = "Endpoint of the Cognitive Services"
  value       = module.cognitive_services.endpoint
}

# 24. Service Bus Namespace
output "servicebus_namespace_id" {
  description = "ID of the Service Bus Namespace"
  value       = module.servicebus.id
}

# 25. Event Hub Namespace
output "eventhub_namespace_id" {
  description = "ID of the Event Hub Namespace"
  value       = module.eventhub_namespace.id
}

# 26. Cosmos DB Account
output "cosmosdb_account_id" {
  description = "ID of the Cosmos DB Account"
  value       = module.cosmosdb.id
}

output "cosmosdb_endpoint" {
  description = "Endpoint of the Cosmos DB Account"
  value       = module.cosmosdb.endpoint
}

# 27. Data Factory
output "data_factory_id" {
  description = "ID of the Data Factory"
  value       = module.data_factory.id
}

# 28. Batch Account
output "batch_account_id" {
  description = "ID of the Batch Account"
  value       = module.batch_account.id
}

# 29. CDN Profile
output "cdn_profile_id" {
  description = "ID of the CDN Profile"
  value       = module.cdn_profile.id
}

# 30. Container Apps Environment
output "container_app_env_id" {
  description = "ID of the Container Apps Environment"
  value       = module.container_app_env.id
}

# 31. Managed Disk
output "managed_disk_id" {
  description = "ID of the Managed Disk"
  value       = module.managed_disk.id
}

# 32. Route Table
output "route_table_id" {
  description = "ID of the Route Table"
  value       = module.route_table.id
}

# 33. AVD Host Pool
output "avd_host_pool_id" {
  description = "ID of the AVD Host Pool"
  value       = module.avd_host_pool.id
}

# 34. AVD Workspace
output "avd_workspace_id" {
  description = "ID of the AVD Workspace"
  value       = module.avd_workspace.id
}

# 35. AVD Application Group
output "avd_app_group_id" {
  description = "ID of the AVD Application Group"
  value       = module.avd_app_group.id
}

# 36. Application Insights
output "application_insights_id" {
  description = "ID of Application Insights"
  value       = module.application_insights.id
}

output "application_insights_instrumentation_key" {
  description = "Instrumentation key (sensitive)"
  value       = module.application_insights.instrumentation_key
  sensitive   = true
}

# 37. Kusto Cluster
output "kusto_cluster_id" {
  description = "ID of the Kusto (Data Explorer) Cluster"
  value       = module.kusto_cluster.id
}

output "kusto_cluster_uri" {
  description = "URI of the Kusto Cluster"
  value       = module.kusto_cluster.uri
}

# 38. NAT Gateway
output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = module.nat_gateway.id
}

# 39. DDoS Protection Plan
output "ddos_plan_id" {
  description = "ID of the DDoS Protection Plan"
  value       = module.ddos_plan.id
}

# 40. Automation Account
output "automation_account_id" {
  description = "ID of the Automation Account"
  value       = module.automation_account.id
}

# 41. Backup Vault
output "backup_vault_id" {
  description = "ID of the Backup Vault"
  value       = module.backup_vault.id
}

# 42. Communication Services
output "communication_service_id" {
  description = "ID of the Communication Services resource"
  value       = module.communication_service.id
}

# 43. App Configuration
output "app_config_id" {
  description = "ID of the App Configuration Store"
  value       = module.app_config.id
}

output "app_config_endpoint" {
  description = "Endpoint of the App Configuration"
  value       = module.app_config.endpoint
}

# 44. Container Instance Group
output "container_group_id" {
  description = "ID of the Container Group"
  value       = module.container_group.id
}

output "container_group_ip_address" {
  description = "Public IP address of the Container Group"
  value       = module.container_group.ip_address
}

# 45. Firewall Policy
output "firewall_policy_id" {
  description = "ID of the Firewall Policy"
  value       = module.firewall_policy.id
}

# 46. Compute Gallery
output "compute_gallery_id" {
  description = "ID of the Compute Gallery"
  value       = module.compute_gallery.id
}

# 47. SSH Public Key
output "ssh_key_id" {
  description = "ID of the SSH Public Key resource"
  value       = module.ssh_key.id
}

# 48. Logic App Workflow
output "logic_app_id" {
  description = "ID of the Logic App Workflow"
  value       = module.logic_app.id
}

# 49. Static Web App
output "static_site_id" {
  description = "ID of the Static Web App"
  value       = module.static_site.id
}

output "static_site_default_host_name" {
  description = "Default hostname of the Static Site"
  value       = module.static_site.default_host_name
}

# 50. Machine Learning Workspace
output "ml_workspace_id" {
  description = "ID of the Machine Learning Workspace"
  value       = module.ml_workspace.id
}

output "ml_workspace_discovery_url" {
  description = "Discovery URL for ML Studio"
  value       = module.ml_workspace.discovery_url
}

# 51. Network Watcher
output "network_watcher_id" {
  description = "ID of the Network Watcher"
  value       = module.network_watcher.id
}

# 52. Resource Guard
output "resource_guard_id" {
  description = "ID of the Backup Resource Guard"
  value       = module.resource_guard.id
}

# 53. DNS Resolver
output "dns_resolver_id" {
  description = "ID of the DNS Resolver"
  value       = module.dns_resolver.id
}

# 54. Azure VMware Solution Private Cloud
output "avs_private_cloud_id" {
  description = "ID of the AVS Private Cloud"
  value       = module.avs_private_cloud.id
}
