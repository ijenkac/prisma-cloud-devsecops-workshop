data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name                 = "HelloWorld"
    yor_name             = "web"
    yor_trace            = "cca64eef-f036-420a-bee6-619a98c15b79"
    git_commit           = "1b5ba54e8cb555f64f8a5852602e08955109f6fe"
    git_file             = "code/build/ec2.tf"
    git_last_modified_at = "2024-12-12 10:46:54"
    git_last_modified_by = "ijenkac@users.noreply.github.com"
    git_modifiers        = "ijenkac"
    git_org              = "ijenkac"
    git_repo             = "prisma-cloud-devsecops-workshop"
  }
}
