# Dev-Op-Test-3
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
