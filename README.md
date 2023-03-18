# Terraform Module to deploy Lambda function and upload code to AWS S3

## Pre-requisites
Install the following:
- [AWS CLI](https://aws.amazon.com/cli/)
- [Terraform](https://www.terraform.io/downloads.html)


After installing the AWS CLI. Configure it to use your credentials.
This enables Terraform access to the configuration file and performs operations on your behalf with these security credentials.

```shell
$ aws configure
AWS Access Key ID [None]: <YOUR_AWS_ACCESS_KEY_ID>
AWS Secret Access Key [None]: <YOUR_AWS_SECRET_ACCESS_KEY>
Default region name [None]: <YOUR_AWS_REGION>
```
 
## How to use
> Ensure you configure `backend.tf` to contain the backend bucket name, path to key and region.


Clone the repository and initalize your Terraform workspace with the following command:

```shell
$ terraform init
```

Execute the following to see what the infrastructure looks like (provide the necessary values):

```shell
$ terraform plan
```


Then, provision your EC2 instance by running `terraform apply` (Ensure to pass necessary values). This will take approximately 10 minutes.

```shell
$ terraform apply
```
