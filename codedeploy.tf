resource "aws_codedeploy_app" "app" {
  name             = "example-deploy-app"
  compute_platform = "Server"
}

resource "aws_codedeploy_deployment_group" "deploy_group" {
  app_name              = aws_codedeploy_app.app.name
  deployment_group_name = "example-deploy-group"
  service_role_arn      = aws_iam_role.codedeploy_role.arn

  deployment_config_name = aws_codedeploy_deployment_config.custom_config.deployment_config_name
  autoscaling_groups     = ["Riddhasoft-web-asg"]

  deployment_style {
    deployment_type   = "IN_PLACE"
    deployment_option = "WITH_TRAFFIC_CONTROL"
  }

  load_balancer_info {
    elb_info {
      name = "Riddhasoft-ALB-web"
    }
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }
}

resource "aws_codedeploy_deployment_config" "custom_config" {
  deployment_config_name = "CustomOneAtATime"

  minimum_healthy_hosts {
    type  = "HOST_COUNT"
    value = 1
  }
}

resource "aws_iam_role" "codedeploy_role" {
  name = "codedeploy-service-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "codedeploy.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "codedeploy_policy" {
  role = aws_iam_role.codedeploy_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "codedeploy:*",
        Effect   = "Allow",
        Resource = "*"
      },
      {
        Action   = "autoscaling:*",
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}
