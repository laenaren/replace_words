

locals {
}

##################################################
##            TF                                ##
##################################################

##### Create API Gateway

resource "aws_apigatewayv2_api" "tmnl-api-gateway" {
  name          = "TMNL API GW"
  protocol_type = "HTTP"
}

# Create lambda funtinion that will be invoked from said api GW
resource "aws_lambda_function" "replace_words_lambda" {
  filename      = replace_words.py
  function_name = replace_words
  #role          = var.iam_for_lambda_arn
  handler       = replace_words
  runtime       = "python3.7"
  timeout       = 300
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.replace_words_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  # The "/*/*" portion grants access from any method on any resource
  # within the API Gateway REST API.
  source_arn = "${var.api-gateway-execution-arn}/*/*"
}

#Create cooudwatch logs
resource "aws_cloudwatch_log_group" "log_group_for_lambda" {
  name = "/aws/lambda/${var.full_env_name}-dim-import"
  # retention_in_days = 14
  tags = {
    Name        = "${var.full_env_name}-dim-import"
  }
}



