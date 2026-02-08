# 3-Tier Web Application Demo

**Author:** Mohamed Hashem DevOps - Cloud  
**GitLab Mirror:** This repository is mirrored from GitLab for CI/CD purposes.  

---

## Project Overview

This repository demonstrates a **3-tier web application** with a PostgreSQL database, a Flask backend, and a simple HTML/JavaScript frontend. The application is containerized using **Docker** and deployed on **AWS EKS** using **Terraform**.  

The frontend provides a **"Ping Backend"** button that triggers the backend to check connectivity to the database. This demonstrates the interaction between the three tiers: frontend → backend → database.

---

## Project Tree

├── app
│   ├── backend
│   │   ├── app.py
│   │   ├── Dockerfile
│   │   └── requirements.txt
│   ├── docker-compose.yml
│   └── frontend
│       ├── Dockerfile
│       └── index.html
├── htht
├── k8s
│   ├── backend-deployment.yaml
│   ├── frontend-deployment.yaml
│   ├── namespace.yaml
│   ├── servicebackend.yaml
│   └── servicefrontend.yaml
├── README.md
├── scripts
│   ├── apply-infra.sh
│   └── cleanup.sh
└── terraform
    ├── database.tf
    ├── ec2-gitlabrunner.tf
    ├── ecr.tf
    ├── eks.tf
    ├── iam.tf
    ├── outputs.tf
    ├── provider.tf
    ├── scg.tf
    ├── terraform.tfstate
    ├── terraform.tfstate.backup
    ├── variables.tf
    └── vpc.tf

---

## Technologies Used

- **Cloud & Infrastructure:** AWS, Terraform  
- **Containerization & Orchestration:** Docker, Kubernetes (EKS)  
- **Container Registry:** AWS ECR  
- **CI/CD:** GitLab CI/CD  
- **Database:** PostgreSQL on AWS RDS  
- **Networking:** VPC, subnets, route tables, security groups  

---

## AWS Resources Overview

- **VPC & Networking:**  
  - Public & private subnets  
  - Internet Gateway  
  - Route tables  
  - Security groups  

- **Database:**  
  - AWS RDS PostgreSQL instance  
  - Private subnet group  
  - Secured with security groups  

- **Compute & CI/CD:**  
  - EC2 instance as GitLab Runner  
  - IAM roles for Runner, EKS cluster, and nodes  

- **Containers & Orchestration:**  
  - ECR repositories for frontend and backend images  
  - EKS cluster with worker nodes  
  - Kubernetes namespace, deployments, and services  
  
