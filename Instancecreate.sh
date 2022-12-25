#CONNECT AWS CLI
aws configure
#access key:*******
#access password:********
#Creating a VPC
aws ec2 create-vpc --cidr-block 10.0.0.0/16
#Creating Subnets
aws ec2 create-subnet --vpc-id <vpcId> --cidr-block 10.0.1.0/24
aws ec2 create-subnet --vpc-id <vpcId> --cidr-block 10.0.2.0/24
#Creating Internet Gateway
aws ec2 create-internet-gateway
aws ec2 attach-internet-gateway --vpc-id <vpcId> --internet-gateway-id <InternetGatewayId>
#Creating Route Table
aws ec2 create-route-table --vpc-id <vpcId>
aws ec2 create-route --route-table-id <RouteTableId> --destination-cidr-block 0.0.0.0/0 --gateway-id <nternetGatewayI>
#Viewing the Route Table and Subnets
aws ec2 describe-route-tables --route-table-id <RouteTableId>
aws ec2 describe-subnets --filters "Name=vpc-id,Values=<vpcId>" --query "Subnets[*].{ID:SubnetId,CIDR:CidrBlock}"
#Associating Route Table and modifying subnet 
aws ec2 associate-route-table --subnet-id <SubnetId> --route-table-id <RouteTableId>
aws ec2 modify-subnet-attribute --subnet-id <SubnetId> --map-public-ip-on-launch
#Creating Key Pair and Security Group
aws ec2 create-key-pair --key-name AWS-Keypair --query "KeyMaterial" --output text > "C:\AWS\AWS_Keypair.pem"
aws ec2 create-security-group --group-name <security-group-name> --description "<description>" --vpc-id <vpcid>
aws ec2 authorize-security-group-ingress --group-id <GroupId> --protocol tcp --port 22 --cidr 0.0.0.0/0
#Running the EC2 Instance
aws ec2 run-instances --image-id <ami-id> --count 1 --instance-type t2.micro --key-name <Keypair-name> --security-group-ids <SecurityGroupId> --subnet-id <SubnetId>
aws ec2 describe-instances --instance-id <InstanceId>
