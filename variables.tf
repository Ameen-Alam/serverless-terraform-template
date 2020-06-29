# variable "REGISTRY" {
#   type    = string
#   default = "gcr.io/skills-online/skillsonline"
# }
variable "BUILD_NUMBER" {
  type    = string
  default = "latest"
}
variable "service_account_key" {
  type    = string
  default = "/var/lib/jenkins/credentials.json"
}

# variable "GCP_DEFAULT_REGION" {
#   type    = string
#   default = "asia-east1"
# }
# variable "PROJECT_NAME" {
#   type    = string
#   default = "skills-online"
# }
