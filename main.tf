resource "aws_instance" "ec2_instance" {
  count                  = (var.number_of_instances) == 2 ? 0 : 1
  ami                    = var.ami_id
  subnet_id              = element(var.subnet_id, count.index)
  #instance_name          = var.instance_name
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.main.id]
  key_name               = "muvi-${var.stage}-key-01"

  provisioner "file" {
    source      = "/home/muvi/.ssh/id_rsa"
    destination = "/home/id_rsa"

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("/home/muvi/.ssh/id_rsa")
      timeout     = "4m"

    }
  }

  tags = {
    name = "${var.stage}-devops-01"
  }
}

resource "aws_key_pair" "staging" {
  key_name   = "muvi-${var.stage}-key-01"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC+VsG4Bl7f9ue9dVY8sF+doOa0QpuQqnjaayUoQ5XzYmf8i7ZBTbTSLl4RajtemhIxQovss7yQT6nQKs3LF2/sC5gFRLeaMJF0NhrT2t4zSqRJFFgN+JBwch4b0WX511qZc+DJ9w376WgPXTqQeS2a7FwcEEJEC2fnEgflU6247RnWiXmewLqOEhWilV0Ek8InXkghH/TuoNNKOsQxtZN7MUoPiIq9tATOcDnhNFwiv7kpM9MaEdr8Hfpyk+Cn3JRcMaGwiGb8/c2GoKzXm8RZAE8SGYn5nGUB7Plq9nwZWRfaN04O9cx7yWGDaDMLwncNs9/EYmQ1ANvXwelHbqmXI6Xdvn0DhI0izFc22zgmXC280ov0X3p2irDossP1cbJ+uaYcO2eXGbhvkwJbhhRh3yCkpbQlk8HGF9Yr3t8xoFURzsLpOECDSOW4+64F9tlrILajXrMMx9cDQLQIWkNnhhl2sQSTgg+PZmCQ9EOUNA5FulefvJR0W4nRvRYF1VeioBalo1NxGm4UH5xi0NNReGynw/sziyFCul88XR2hFsabDfF1kKqcOzHqEhkVCM9wF4NZjsPNTUX3IZJbFp7eMfDQy8gMVCNhJGdLb3m7YXyhQDc++u/MwES4R8BKQ3RIyysUykAgg6uh7+hOEFk7BgycIixeIAzdw3Rs8SObeQ== muvi@DESKTOP-3J7EH2P"

}


