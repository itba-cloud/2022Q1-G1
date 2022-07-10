# --------------------------------------------------------------------
# Amazon WAF output
# --------------------------------------------------------------------

output "web_acl_arn" {
  description = "WAF Web ACL ARN"
  value       = aws_wafv2_web_acl.this.arn
} 