variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
  default     = ""
}

variable "mongodb_helm_version" {
  type        = string
  description = "MongoDB Helm Chart Version"
  default     = "16.4.5"
}