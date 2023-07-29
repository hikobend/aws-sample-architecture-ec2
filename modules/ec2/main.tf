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

      # targets = [
      #   for ec2_instance_1a_id in var.ec2_instance_1a_ids : {
      #     target_id = ec2_instance_1a_id
      #     port      = var.http_port
      #   }
      # ]
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

module "alb_access_log_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  bucket = "${var.env}-alb-access-log-bucket-s3"
  acl    = "log-delivery-write"

  # Allow deletion of non-empty bucket
  force_destroy = true

  control_object_ownership       = true
  object_ownership               = "ObjectWriter"
  attach_elb_log_delivery_policy = true

  tags = {
    name = "${var.env}-alb-access-log-bucket-s3"
  }
}
