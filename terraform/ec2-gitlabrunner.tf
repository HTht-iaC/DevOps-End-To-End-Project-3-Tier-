resource "aws_security_group" "runner_sg" {
  name        = "gitlab-runner-sg"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "gitlab_runner" {
  ami           = "ami-0532be01f26a3de55" 
  instance_type = "t3.medium"
  key_name      = "myinstnacekeypair" 

  iam_instance_profile = aws_iam_instance_profile.runner_profile.name
  vpc_security_group_ids = [aws_security_group.runner_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y docker aws-cli
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ec2-user
              curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
              install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
              curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh" | bash
              dnf install -y gitlab-runner
              usermod -aG docker gitlab-runner
              systemctl enable gitlab-runner
              systemctl start gitlab-runner
              EOF

  tags = {
    Name = "GitLab-Runner-Server"
  }
}

output "runner_public_ip" {
  value = aws_instance.gitlab_runner.public_ip
}
