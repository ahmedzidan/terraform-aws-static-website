variable "bucket_name" {
  description = "bucket name"
  type = string
}
variable "tags" {
  description = "tags to be added for the resources"
  type = map(any)
}
variable "folder_path" {
  description = "folder path to be uploaded"
  type = string
}
