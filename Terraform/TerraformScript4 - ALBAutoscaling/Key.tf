resource "aws_key_pair" "key" {
  key_name   = "key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
  lifecycle {
    ignore_changes = [public_key]
  }
}
