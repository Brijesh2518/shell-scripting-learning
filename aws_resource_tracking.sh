#!/bin/bash



################################
# Author : Brijesh
# Date : 14/04/2026
# Version : V1

# This script will report the aws resource usage

# #################################

# AWS ec2
# AWS S3
# AWS Lambda
# AWS IAM

set -x

#list of ec2 instance and only show instance id 
echo "Print list of ec2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' > resourceTracker

# list of s3 bucket
echo "Print list of s3 bucket"
aws s3 ls > resourceTracker

# list of lambda function 
echo "Print list of lambda function"
aws lambda list-functions > resourceTracker

# list of IAM user
echo "Print list of IAM users"
aws iam list-users > resourceTracker
