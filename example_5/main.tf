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
  
  for_each = {
    "example1" = "tutorial1",
    "example2" = "tutorial2"
  }
  image = docker_image.nginx.image_id
  name  = "${each.value}"
}

### Output variables
output "container_id_example1" {
  description = "First Container ID"
  value = docker_container.nginx["example1"].id
}

output "container_id_example2" {
  description = "First Container ID"
  value = docker_container.nginx["example2"].id
}
