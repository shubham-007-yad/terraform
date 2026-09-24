variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "mongo_uri" {
  description = "mongodb+srv://flask69:tute69@cluster0.dtgxpxo.mongodb.net/?appName=Cluster0"
  type        = string
  sensitive   = true
}