terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}


resource "docker_image" u21{
				name= "tomcat"
			}


resource "docker_container" "tc1" {
  name  = "tomcat1"
  image = docker_image.u21.name

  ports {
    internal = 8080
    external = 8084
  }
  command = ["bin/catalina.sh", "run"]
}
