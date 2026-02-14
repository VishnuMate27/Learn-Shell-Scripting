#aws_resources_tracker.sh
#!/bin/bash
#
# This script will list down all active resources in AWS
#
#####################
##Author: Vishnu
#
##Description: This script list down resources the below aws resouces using AWS CLI
#1.AWS S3 buckets
#2.AWS EC2 instances
#3.AWS Lambda functions
#4.AWS IAM Users
######################

set -x #(Debug Mode)

# This line will list all s3 buckets
echo "Listing all S3 buckets"
aws s3 ls

# This line will list the EC2 instances
echo "Listing all EC2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

# This line will list all Lambda functions
echo "Listing all lambda functions"
aws lambda list-functions

# This line will list all IAM Users 
echo "Listing all IAM Users"
aws iam list-users | jq '.Users[].UserId'
