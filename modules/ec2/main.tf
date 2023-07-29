module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name                       = "${var.env}-alb"
  load_balancer_type         = "application"
  vpc_id                     = var.vpc_id
  subnets                    = [var.public_subnet_1a_id, var.public_subnet_1c_id]
  security_groups            = [var.alb_sg]
  internal                   = false
  drop_invalid_header_fields = true
  access_logs = {
    bucket = module.alb_access_log_bucket.s3_bucket_id
  }


  target_groups = [
    {
      name             = "${var.env}-tg"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        my_target = {
          target_id = module.ec2_instance_1a.id
          port      = 80
        }
      }
    }
  ]
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]
}

module "ec2_instance_1a" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = "${var.env}-ec2-instance-1a"
  instance_type          = "t2.micro"
  ami                    = "ami-0329eac6c5240c99d"
  monitoring             = true
  vpc_security_group_ids = [var.application_sg, var.ssm_sg]
  subnet_id              = var.private_subnet_1a_id
  availability_zone      = var.availability_zone_1a
  iam_instance_profile   = aws_iam_role.EC2_enable_SSM_connect_role.arn
  # user_data = local.user_data
  metadata_options = {
    http_tokens = "required"
  }

  root_block_device = [
    { encrypted = true }
  ]

  tags = {
    Name = "${var.env}-ec2-instance-1a"
  }
}


module "alb_access_log_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  bucket = "${var.env}-alb-access-log-bucket-s3"
  acl    = "log-delivery-write"

  # Allow deletion of non-empty bucket
  force_destroy = true

  control_object_ownership       = true
  object_ownership               = "ObjectWriter"
  attach_elb_log_delivery_policy = true

  versioning = {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    name = "${var.env}-alb-access-log-bucket-s3"
  }
}

resource "aws_iam_role" "EC2_enable_SSM_connect_role" {
  name = "${var.company_name}-EC2-enable-SSM-connect-role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "sts:AssumeRole"
        ],
        "Principal" : {
          "Service" : [
            "ec2.amazonaws.com"
          ]
        }
      }
    ]
  })
}
