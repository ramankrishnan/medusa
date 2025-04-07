🧵 Medusa Backend Deployment on AWS (ECS + Terraform + Docker + GitHub Actions)
===============================================================================

This project demonstrates how to deploy a [MedusaJS](https://medusajs.com) headless commerce backend on AWS using:

*   **Terraform** for infrastructure provisioning
*   **Docker** for containerization
*   **ECS Fargate** for serverless container hosting
*   **GitHub Actions** for CI/CD automation

* * *

📁 Project Structure
--------------------

My-Medusa-Store/
├── my-medusa-store/                  # Medusa backend code
│   ├── Dockerfile                    # Docker config for Medusa backend
│   └── Terraform/                    # Terraform scripts for AWS infra
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       ├── terraform.tfvars
│       └── ...
├── my-medusa-store-storefront/      # (Optional) Frontend (not covered here)
└── .github/
    └── workflows/
        └── main.yml                 # GitHub Actions CI/CD pipeline

* * *

⚙️ What It Provisions via Terraform
-----------------------------------

*   ✅ VPC (with subnets, route tables, and IGW)
*   ✅ ECS Cluster (Fargate)
*   ✅ Task Definition
*   ✅ Security Groups
*   ✅ IAM Roles (ECS execution and task)
*   ✅ ECR Repository (for Docker image)
*   ✅ Application Load Balancer

* * *

🚀 Deployment Steps
-------------------

### 1\. Clone This Repo

    
    git clone https://github.com/trivediayush/Medusa-Store.git
    cd Medusa-Store
    

### 2\. Set Up Your Terraform Variables

    
    aws_region      = "eu-north-1"
    db_password     = "your-secure-password"
    ecr_repo_name   = "your-ecr-repo-name"
    medusa_port     = 9000
    

### 3\. Authenticate to AWS CLI Locally (Optional)

    aws configure

* * *

🐳 Docker
---------

The Medusa backend is containerized using a Dockerfile located inside `my-medusa-store/`.

    
    FROM node:18
    
    WORKDIR /app
    
    COPY . .
    
    RUN npm install
    RUN npm run build
    
    EXPOSE 9000
    
    CMD ["npm", "start"]
    

* * *

⚙️ Terraform Commands (Manual Deployment)
-----------------------------------------

    
    cd my-medusa-store/Terraform
    
    terraform init
    terraform plan -var-file="terraform.tfvars"
    terraform apply -auto-approve -var-file="terraform.tfvars"
    

* * *

🤖 GitHub Actions CI/CD
-----------------------

The file `.github/workflows/main.yml` automates the deployment process:

*   ✅ Checks out code
*   ✅ Builds Docker image
*   ✅ Pushes to ECR
*   ✅ Runs Terraform to provision/update infra

### Set These Secrets in GitHub:

Name

Description

AWS\_ACCESS\_KEY\_ID

AWS access key

AWS\_SECRET\_ACCESS\_KEY

AWS secret key

DB\_PASSWORD

RDS or service DB password

✅ CI/CD triggers on `main` branch push

* * *

📸 Deployment Preview
---------------------

![Deployment Workflow](./deployment.gif)

* * *

📌 Notes
--------

*   Uses ECS Fargate – No EC2 management
*   Infra is idempotent via Terraform
*   Secure secrets management via GitHub
*   Highly scalable & production ready architecture

* * *

🙌 Credits
----------

*   [MedusaJS](https://medusajs.com)
*   [Terraform by HashiCorp](https://www.terraform.io/)
*   [AWS ECS Fargate](https://aws.amazon.com/fargate/)
*   [GitHub Actions](https://github.com/features/actions)

* * *

📫 Contact
----------

Made with ❤️ by [Ayush Trivedi](https://github.com/trivediayush)
