resource "aws_vpc" "vpc_west1" {
  cidr_block = "10.0.0.0/16"
  provider = aws.west1
  
  tags = {
    name = "vpc_west1"
  }

  provisioner "local-exec" {
    when    = create
    command = "echo ${self.tags.name}: ${self.cidr_block}\n echo $MESSAGE"
    interpreter = ["/bin/sh", "-c"]
    environment = {
      MESSAGE = "Success"
    }
    on_failure = continue
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo ${self.tags.name}: ${self.cidr_block} >> destroy.txt"
    interpreter = ["/bin/sh", "-c"]
    on_failure = fail
  }
}