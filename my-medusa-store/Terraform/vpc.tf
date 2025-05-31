data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_subnet" "subnets" {
  for_each = toset(data.aws_subnet_ids.default.ids)
  id       = each.value
}
