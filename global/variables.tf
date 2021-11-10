variable "s3_bucket" {
    default = "enobasin"
    description = "Bucket Name"
    type = string
}

variable "db_name" {
    default = "terraform-lock"
    description = "Database Name"
    type = string
}