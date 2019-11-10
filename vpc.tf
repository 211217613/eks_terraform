data "aws_availability_zones" "available" {}

resource "aws_vpc" "eks" {
  cidr_block = "10.0.0.0/16"
  tags = "${
    map(
      "Name", "terraform-eks-demo-node",
      "kubernetes.io/cluster/${var.cluster-name}", "shared",

    )
  }"
}

resource "aws_subnet" "demo" {
  count             = 2
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = "10.0.${count.index}.0.24"
  vpc_id            = aws_vpc.eks.id
  tags = "${
    map(
      "Name", "terraform-eks-demo-node",
      "kubernetes.io/cluster/${var.cluster-name}", "shared",

    )
  }"

}
