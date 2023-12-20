terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}


resource "docker_container" "nginx" {
  
  image = var.container_image_id
  name  = var.container_name
}
