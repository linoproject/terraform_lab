terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}


resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}


resource "docker_container" "nginx" {
  
  count = 4
  image = docker_image.nginx.image_id
  name  = "tutorial${count.index}"
}

### Output variables
output "container_id" {
  description = "First Container ID"
  value = docker_container.nginx[0].id
}

output "all_container_id" {
  description = "First Container ID"
  value = docker_container.nginx[*].id
}