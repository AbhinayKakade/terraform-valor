variable "project" {
  description = "The ID of the project in which to enable APIs"
  type        = string
}

variable "api_services" {
  description = "List of APIs to enable"
  type        = list(string)
}
