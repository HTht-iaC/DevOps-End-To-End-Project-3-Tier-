# 3-Tier Web Application Demo

**Author:** Mohamed Hashem (DevOps - Cloud)    

---

## Project Overview

This repository demonstrates a **3-tier web application** with a PostgreSQL database, a Flask backend, and a simple HTML/JavaScript frontend. The application is containerized using **Docker** and deployed on **AWS EKS** using **Terraform**.  

The frontend provides a **"Ping Backend"** button that triggers the backend to check connectivity to the database. This demonstrates the interaction between the three tiers: frontend → backend → database.

---

## Project Architecture
<img width="842" height="1264" alt="End To End DevOps Arch" src="https://github.com/user-attachments/assets/f6435677-d0d5-4835-90a8-6d3193ebc342" />


## Project Tree

├── app<img width="468" height="826" alt="Screenshot (220)" src="https://github.com/user-attachments/assets/90b80c5f-d4b7-4a45-b093-3544016e8d3b" />


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
  
