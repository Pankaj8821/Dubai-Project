terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket         = "pankaj0309-eks-app-file"         # 🔁 S3 bucket name (must exist)
    key            = "eks-cluster/terraform.tfstate"   # 📄 path to tfstate file inside the bucket
    region         = "us-west-2"                       # 🌍 AWS region
    dynamodb_table = "terraform-lock-table-1"          # 🔒 DynamoDB table for state locking
    encrypt        = true
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.24"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.11"
    }
  }
}
