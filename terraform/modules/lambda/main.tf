locals {
  iam_for_lambda_arn =  "arn:aws:iam::162338488681:role/service-role/replace_words2-role-koorsr4k"
}

# Create a zip for the funtion
data "archive_file" "replace" {
  type = "zip"
  source_file = "../../../lambda_funtion.py"
  output_path = "lambda_function.zip"
}

# Create lambda funtinion that will be invoked from said Alb
resource "aws_lambda_function" "replace_words_lambda" {
  filename      = data.archive_file.replace.output_path
  function_name = var.name
  handler       =  "lambda_function.lambda_handler"
  role          = local.iam_for_lambda_arn
  runtime       = "python3.8"
  timeout       = 300
}

output "lambda_to_invoke" {
  value = aws_lambda_function.replace_words_lambda.arn
}




