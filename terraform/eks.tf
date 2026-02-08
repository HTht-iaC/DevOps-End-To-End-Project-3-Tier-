resource "aws_eks_cluster" "Wraith" {
  name     = var.clusterN
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids             = concat(values(aws_subnet.pbsub)[*].id, values(aws_subnet.prvsb)[*].id)
    endpoint_public_access = true
  }
}

resource "aws_eks_node_group" "workers" {
  cluster_name    = aws_eks_cluster.Wraith.name
  node_group_name = "${var.clusterN}-ng"
  node_role_arn   = aws_iam_role.eks_node.arn
  subnet_ids      = values(aws_subnet.pbsub)[*].id

  scaling_config {
    desired_size = 4
    max_size     = 6
    min_size     = 1
  }

  instance_types = ["t3.medium"]
}
