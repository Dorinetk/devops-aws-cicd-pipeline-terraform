locals {
  lambda_zip = "${var.source_directory}/terraform_${var.name}.zip"
}
data "aws_iam_policy_document" "default" {
  version = "2012-10-17"

  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role" "default" {
  assume_role_policy = data.aws_iam_policy_document.default.json
}
resource "aws_iam_role_policy_attachment" "default" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.default.name
}

resource "aws_lambda_function" "default" {
  filename         = local.lambda_zip
  function_name    = var.name
  handler          = var.handler
  memory_size      = ceil(var.memory_mb)
  role             = aws_iam_role.default.arn
  runtime          = var.runtime
  source_code_hash = var.source_directory
  timeout          = var.timeout_after_seconds

  environment {
    // * Environmental keys must not container hyphens "-" https://stackoverflow.com/a/60885479
    variables = merge([for env in var.environment : { (env["key"]) = (env["value"]) }]...)
  }
}