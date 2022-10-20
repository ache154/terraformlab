# Get the image details of a specific AMI
# Following script will get the image details of the ami with ID: 017fecd1353bcc96e, which is amazon/ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20220912
aws ec2 describe-images --owners amazon --image-ids ami-017fecd1353bcc96e 
