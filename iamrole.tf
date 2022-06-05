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

# Attaching the policy to the role
resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.EC2-role.name
  policy_arn = aws_iam_policy.EC2-policy.arn
}
