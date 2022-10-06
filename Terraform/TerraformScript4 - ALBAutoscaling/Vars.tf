variable "AWS_REGION" {
  default = "us-east-2"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "key.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-2 = "ami-778696"
    us-east-1 = ""
    us-west-2 = ""
  }
}
