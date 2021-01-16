variable "bucket_name" {
  description = "bucket name"
  type = string
}
variable "tags" {
  description = "tags for the subnet"
  type = map(any)
}
variable "folder_path" {
  description = "file path to be uploaded"
  type = string
}
