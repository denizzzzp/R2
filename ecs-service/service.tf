resource "aws_ecs_service" "test-ecs-service" {
  	name            = "test-ecs-service"
  	iam_role        = "${var.ecs_iam_role}"
  	cluster         = "${var.ecs_cluster}"
  	task_definition = "${aws_ecs_task_definition.nginx.arn}"
  	desired_count   = 1

  	load_balancer {
    	  target_group_arn  = "arn:aws:elasticloadbalancing:us-east-1:835141733713:targetgroup/ecs-target-group/1446ad9f4f50dd7b"
    	  container_port    = 80
    	  container_name    = "nginx"
	}
}
