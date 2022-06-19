# ------------------------------------------------------------------------------
# Amazon Lambda
# ------------------------------------------------------------------------------

resource "aws_lambda_function" "this" {
  # provider = aws.aws
  filename      = var.lambda_info.filename
  function_name = var.lambda_info.function_name
  role          = "arn:aws:iam::${var.account_id}:role/LabRole"
  handler       = var.lambda_info.handler
  runtime       = "python3.9"
}

resource "aws_lambda_permission" "this" {
  # provider = aws.aws

  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn    = "${var.apigw_execution_arn}/*/${var.lambda_info.method}${var.lambda_info.path}"
}
