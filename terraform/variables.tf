variable "region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "secure-enclave-pattern"
}

variable "repo_url" {
  type        = string
  description = "Public GitHub repo URL, e.g., https://github.com/SahithiAekka/secure-enclave-pattern.git"
}
