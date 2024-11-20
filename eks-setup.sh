
# create cluster without nodegroup
eksctl create cluster --name=ecommerceapp \
    --region=eu-central-1 \
    --vpc-private-subnets=<your-private-subnet-ids>  \
    --without-nodegroup

# Associate IAM OIDC
eksctl utils associate-iam-oidc-provider \
    --region=eu-central-1 \
    --cluster=ecommerceapp \
    --approve

# Create EKS nodegroup with private subnets
eksctl create nodegroup --cluster=ecommerceapp \
    --region=us-east-2 \
    --name=ecommerceapp-node \
    --subnet-ids=<your-private-subnet-ids> \
    --node-type=t3.medium \
    --nodes=4 \
    --nodes-min=4 \
    --nodes-max=6 \
    --node-volume-size=20 \
    --ssh-access \
    --ssh-public-key=ecommerce-kube \
    --managed \
    --asg-access \
    --external-dns-access \
    --full-ecr-access \
    --appmesh-access \
    --alb-ingress-access \
    --node-private-networking





















