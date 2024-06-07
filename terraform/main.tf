

resource "aws_ecr_repository" "hello_world" {
  name = "hello-world"
}

resource "aws_ecs_cluster" "hello_world_cluster" {
  name = "hello-world-cluster"
}

resource "aws_ecs_task_definition" "hello_world_task" {
  family                   = "hello-world-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name      = "hello-world"
      image     = aws_ecr_repository.hello_world.repository_url
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "hello_world_service" {
  name            = "hello-world-service"
  cluster         = aws_ecs_cluster.hello_world_cluster.id
  task_definition = aws_ecs_task_definition.hello_world_task.arn
  desired_count   = 1

  launch_type = "FARGATE"

  network_configuration {
    subnets          = ["subnet-0bb1c79de3EXAMPLE"] # Replace with your subnet ID
    security_groups  = ["sg-0c7a2f1e1eEXAMPLE"] # Replace with your security group ID
    assign_public_ip = true
  }
}
