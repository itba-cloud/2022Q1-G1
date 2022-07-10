# ---------------------------------------------------------------------------
# Amazon S3 datasources
# ---------------------------------------------------------------------------

data "aws_iam_policy_document" "website" {

  statement {
    sid     = "PublicReadGetObject"
    effect  = "Allow"
    actions = ["s3:GetObject"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = ["${aws_s3_bucket.website.arn}/*"]
  }
}

data "aws_iam_policy_document" "www" {

  statement {
    sid     = "PublicReadGetObject"
    effect  = "Allow"
    actions = ["s3:GetObject"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = ["${aws_s3_bucket.www.arn}/*"]
  }
}