locals {
  lambda_to_invoke_arn = var.lambda_to_invoke
}

data "aws_vpc" "default" {
  default = true
} 
data "aws_subnet_ids" "vpc_subnet_ids" {
  vpc_id = data.aws_vpc.default.id
}
data "aws_subnet" "test_subnet" {
  count = "${length(data.aws_subnet_ids.vpc_subnet_ids.ids)}"
  id    = "${tolist(data.aws_subnet_ids.vpc_subnet_ids.ids)[count.index]}"
}
data "aws_security_group" "default_sg" {
  vpc_id = data.aws_vpc.default.id

  filter {
    name   = "group-name"
    values = ["default"]
  }
}

resource "aws_apigatewayv2_api" "replace_api_gateway" {
  name          = var.apigw_name
  protocol_type = "HTTP"
  tags = {
    Name        = var.apigw_name
  }
}

resource "aws_apigatewayv2_integration" "replcace_integration" {
  api_id               = aws_apigatewayv2_api.replace_api_gateway.id
  integration_type       = "HTTP_PROXY"
  integration_method     = "POST"
  integration_uri        = var.lambda_to_invoke_arn
  payload_format_version = "2.0"
}
resource "aws_apigatewayv2_route" "replace_api_gateway_route" {
  api_id               = aws_apigatewayv2_api.replace_api_gateway.id
  route_key            = "POST /"
  target               = "integrations/${aws_apigatewayv2_integration.replcace_integration.id}"
}

output "api_url" {
  value = aws_apigatewayv2_api.replace_api_gateway.api_endpoint
}