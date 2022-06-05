# Creating an AWS IAM role

resource "aws_iam_role" "EC2-role" {
  name = "test-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# Creating an AWS IAM policy

resource "aws_iam_policy" "EC2-policy" {
  name        = "test-policy"
  description = "A test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

data "aws_iam_policy" "ReadOnlyAccess" {
  arn = "arn:aws:iam::471188201673:policy/test-policy"
}

# Attaching the policy to the role

resource "aws_iam_role_policy_attachment" "sto-readonly-role-policy-attach" {
  role       = aws_iam_role.EC2-role.name
  policy_arn = data.aws_iam_policy.ReadOnlyAccess.arn
}