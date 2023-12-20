### Root module

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}



variable "containers" {
  type = list(string)
  default = [ "container1","container2" ]
}


resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}



module "continers" {
  source = "./child_module"

  count = length(var.containers)
  container_image_id = docker_image.nginx.image_id
  container_name = var.containers[count.index]
}