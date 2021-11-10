variable "s3_bucket" {
    default = "enojenkins"
    description = "Bucket Name"
    type = string
}

variable "db_name" {
    default = "terrajen-lock"
    description = "Database Name"
    type = string
}