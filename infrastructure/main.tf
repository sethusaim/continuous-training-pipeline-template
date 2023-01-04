terraform {
  backend "s3" {
    bucket = "ineuron-1-tf-state"
    key    = "tf_state"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "github_runner_sg" {
  source = "./github_runner_sg"
}

