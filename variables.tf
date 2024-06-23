variable "repositories" {
  description = "A map of repositories to create"
  type        = map(object({
    description = string
    visibility  = string
  }))
  default = {}
}