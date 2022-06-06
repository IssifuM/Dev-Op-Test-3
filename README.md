# Dev-Op-Test-3
For this project I am required to
Provisioned some infrastructures with terraform for Cloudrock consulting Ltd
Created Prod-rock-VPC EU-WEST-2 namely with the following component;
2 public subnets 
2 private subnets 
1 public route table 
1 private route table 
Associate the subnets to their respective route tables
An Internet gateway 
Associate with internet gateway with the public route table.
Create NAT gateway.
Associate with a private route table.
Security groups with ports 80 and 22 opened for ingress.
 2 EC2 servers with the Ubuntu 18.04 free tier.
Put one in the public subnet and one in the private subnet.

# Problems face and Action 
After I provisioned all my reources on AWS using terraform. I created a role for the EC2 instance in the private subnet to assume. However, when all resources where provisioned, I realised that the policy had only been created on the console but the EC2 had not fully assumed the role. 

After series of research and reading, I managed to provision the EC2 instance to assume the role via terraform. 

# Notes on how to Attach IAM role to AWS EC2 instance using Terraform
# P.S review these steps against EC2.tf and iamrole.tf for clearer understanding.

1. Create AWS IAM policy file
2. Create a role: a role should cover who or what can assume the role, and  actions available and on which AWS resources.
3. Attach role to policy
4. apply these code on terraform. this will create a policy on AWS cconsole without without EC2 instance assuming the role
5. Copy arn of policy created from your AWS console. and create a data like example below:
data "aws_iam_policy" "ReadOnlyAccess" {
  arn = "insert arn number here"
}
5. Attach role to an instance profile
6. Attach the instance profile to the EC2 instance


# Prerequisite
IAM User's credential used had permission to make make changes/manage all resources using terraform.  

