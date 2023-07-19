variable "acl" {
  description = "The canned ACL to apply. Defaults to 'private'."
  type        = string
  default     = "private"
}

variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use. Valid values are `AES256` and `aws:kms`."
  type        = string
  default     = "AES256"
}

variable "hash_key" {
  description = "The attribute to use as the hash (partition) key. Must also be defined as an attribute."
  type        = string
  default     = "LockID"
}
