# Tasks-in-devops

## Task4 Overview

- Install Terraform on your local laptop
- Create Access keys in your AWS account
- Install AWS CLI on your local laptop
- Configure AWS on your local laptop using Access key and Secret key
- Create Terraform script to create infrastructure on AWS

## Step-by-Step Guide

1. Install Terraform
   - Download and install Terraform on your local laptop from the official website: [Terraform Downloads](https://www.terraform.io/downloads.html).
2. create a main.tf file and write the VPC, Private subnet, Public Subnet, etc code accordingly. I had share a file named as main.tf with you for your refernce.
3. then open cmd where your '.tf' file is present and use these commands...

   - terraform init

     ![init](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/1efcd570-6e75-48a3-b734-371225cc3215)

   - terraform validate

     ![validate](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/1412a10e-50d3-46b9-b3d9-9c44e1c0949f)

   - terraform plan

     ![plan](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/f9fef224-7956-4e2b-adc5-d61d73e38605)

   - terraform apply

    ![apply](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/611a94eb-d22e-4d52-885c-d09a5cfe44f1)


4. Go to VPC console then go to Subnets.

   Check “Public Subnet” is created successfully.

   ![subnets](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/a2655379-b9a6-4844-8f8f-a2e9387eaf7b)

5. you can also see gateways, VPC's and others on AWS console.
6. Open the website URL in a browser to verify that the website is hosted successfully.

   ![0_ZEORwW4AHagYMpvP](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/b052884b-9e21-46d6-9e8c-433321a53ba8)

   ![0_gOOKuyRK8z9lbSvf](https://github.com/deepanshusharma007/Repo-devops-tasks/assets/68854274/81a02ffe-1830-4eef-adb4-c4cd21002de1)
   

