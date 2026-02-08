resource "aws_ecr_repository" "forfrontendimage" {
  name = "prj-back-image"
}

resource "aws_ecr_repository" "forbackendimage" {
  name = "prj-front-image"
}
