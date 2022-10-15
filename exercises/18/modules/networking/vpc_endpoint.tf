resource "aws_vpc_endpoint" "endpoint-s3" {
    vpc_endpoint_type = "Gateway"
    vpc_id = aws_vpc.vpc-0.id
    service_name = "com.amazonaws.eu-west-1.s3"
    policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement":[
    {
        "Effect": "Allow",
        "Principal": "*",
        "Action": "*",
        "Resource": "*"
    }
    ]
}
EOF
    route_table_ids = [
        aws_route_table.rtb-private-a.id
    ]
    private_dns_enabled = false

    tags = {
        Name        = "S3-gw"
    }
}