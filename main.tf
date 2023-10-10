terraform {
  required_providers {
    twc = {
      source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
  }
  required_version = ">= 1.4.4"
}

provider "twc" {
  token = "e**************************************************In0"
}


data "twc_configurator" "configurator" {
  location = "ru-1"
  disk_type = "nvme"
}

data "twc_os" "os" {
  name = "ubuntu"
  version = "22.04"
}


resource "twc_ssh_key" "your-key" {
  name = "Your key"
  body = "ssh-ed25519 AAAAC3NzaC1lZ*****************************SzQnEH7lJ user@worknout"
  #file("~/.ssh/your-key.pub")
}


resource "twc_server" "test-trr" {
  name = "test-trr"
  os_id = data.twc_os.os.id

  configuration {
    configurator_id = data.twc_configurator.configurator.id
    disk = 1024 * 10
    cpu = 1
    ram = 1024
  }
}