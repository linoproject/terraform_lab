terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

#### Variable definition
variable "container_name" {
  type = string
  description = "The conainer name"
  default = "tutorial"
}
variable "container_port_internal" {
  type = number
  description = "The conainer internal port"
  default = 80
}
variable "container_port_external" {
  type = number
  description = "The conainer external port"
  default = 8000
}


resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.container_name # input variable 

  ports {
    internal = var.container_port_internal # input variable 
    external = var.container_port_external # input variable 
  }
}

### Output variables
output "container_id" {
  description = "Container ID"
  value = docker_container.nginx.id
}