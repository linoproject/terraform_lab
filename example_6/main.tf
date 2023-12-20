### Note before running issue a docker pull alpine
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

data "docker_image" "alpine" {
    name = "alpine"
}

output "docker_image" {
  value = data.docker_image.alpine
}