resource "aws_key_pair" "deployer" {
  key_name   = "newdenizzzzp"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8PyJ/k38LdazuO/LojyQyw76HD0/W8PL4ph2a/pH4M3npW4ylRNNYgXAzVVC3TW9tsiybdHYZgVk9fXdJK1ayQcG8F2bGt0+Yp4OBn3VAwJref6vRs192NSn2rCAcZC86oYmoAwcpYof62hITAy2Pqqp+r7rl5xaiedBXFFX8BYWkRK05JhDp5PApAIx3zhFO9leSMIBuoGkEBLajAwif7NmTAHXY0w30q0YROnHFxH2XaiVAkvfWW4QrmO/nniS0sztYVgGnjCWB5BsPsz0etgV0KEcGGqJ8J1fHZrLkN3pCbonoh/TMM3KzpVtZfozf9O9U4cPOqJ+hFoWyvAQR root@devops1"
}

data "template_file" "user_data" {
  template = "${file("templates/user_data.tpl")}"
}

resource "aws_security_group" "alloy-web" {
  name   = "ClusterSecurityGroup"
  ingress {
    from_port         = 22
    to_port           = 22
    protocol          = "TCP"
    cidr_blocks       = ["0.0.0.0/0"]
  }
  ingress {
    from_port         = 80
    to_port           = 80
    protocol          = "TCP"
    cidr_blocks       = ["0.0.0.0/0"]
  }
  ingress {
    from_port         = 443
    to_port           = 443
    protocol          = "TCP"
    cidr_blocks       = ["0.0.0.0/0"]
  }
  egress {
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    cidr_blocks       = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "jenkins" {
  ami           = "${var.ami_id_docker}"
  instance_type = "t2.micro"
  iam_instance_profile = "${aws_iam_instance_profile.ecs-instance-profile.id}"
  key_name = "${aws_key_pair.deployer.key_name}"
  security_groups = ["${aws_security_group.alloy-web.name}"]
  user_data = "${data.template_file.user_data.rendered}"
}