output "vpc_id" {
  value = tomap({
    for key, value in aws_vpc.vpc : key => value.id
  })
  depends_on = [
    aws_vpc.vpc
  ]
}