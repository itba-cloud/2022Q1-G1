# ---------------------------------------------------------------------------
# Amazon VPC
# ---------------------------------------------------------------------------

module "global_settings" {
  source = "../global"
}

data "aws_availability_zones" "this" {
  state = "available"
  filter { ## Only AZs
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }

}

resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    name       = local.aws_vpc.tags.name
  }
}

resource "aws_subnet" "this" {
  count = length(local.private_subnets)

  vpc_id            = aws_vpc.this.id
  availability_zone = data.aws_availability_zones.this.names[count.index % local.total_az]
  cidr_block        = local.private_subnets[count.index]

  tags = {
    name       = local.aws_subnet.tags.name
  }
}


resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

} 
