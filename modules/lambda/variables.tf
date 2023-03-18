variable "environment" {
  default = [{ key = "TERRAFORM_PLACEHOLDER", value = "1" }]
  type = list(object({
    key   = string
    value = string
  }))
}

variable "excluded_files" {
  default = []
  type    = list(string)
}

variable "handler" {
  type = string
}

variable "memory_mb" {
  default = 128
  type    = number

  // * https://docs.aws.amazon.com/lambda/latest/dg/configuration-memory.html
  validation {
    condition     = 128 <= var.memory_mb && var.memory_mb <= 10240
    error_message = "Variable 'ram_mb' must be between 128 - 10,240 MB."
  }
}

variable "name" {
  type = string
}

variable "runtime" {
  type = string
}

variable "source_directory" {
  type = string
}

variable "timeout_after_seconds" {
  default = 3
  type    = number

  validation {
    condition     = 0 <= var.timeout_after_seconds && var.timeout_after_seconds <= 900
    error_message = "Variable 'timeout_after_seconds' must be between 0 - 900 seconds."
  }
}
