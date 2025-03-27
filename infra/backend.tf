terraform {
  backend "s3" {
    bucket         = "codeanding-tcg-demo-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "codeanding-tcg-demo-locks"
  }
}
