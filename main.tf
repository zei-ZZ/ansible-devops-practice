terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {}  # Utilise le Docker local

resource "docker_container" "nginx" {
  name  = "nginx-test"
  image = "nginx:latest"
  ports {
    internal = 80
    external = 5000
  }
}