provider "docker" {}

# Pull the Nginx Docker image
resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

# Create and configure the Nginx container
resource "docker_container" "nginx_container" {
  name  = "nginx_server"
  image = docker_image.nginx_image.name

  ## Map port 80 in the container to port 8080 on the host
  ports {
    internal = 80
    external = 8086
  }
}

