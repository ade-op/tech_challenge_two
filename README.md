
🚀 Tech Challenge Two – Production-Grade CI/CD to AWS EKS

This project demonstrates a full end-to-end DevOps workflow deploying a containerized Node.js application to AWS EKS using Terraform, Docker, Helm, and GitHub Actions CI/CD.

A push to the main branch automatically builds the Docker image, pushes it to Amazon ECR, updates Kubernetes manifests using Helm, and deploys to a live EKS cluster behind an AWS Application Load Balancer.

📌 Architecture Overview

Workflow Pipeline

GitHub → GitHub Actions → Docker Build → Amazon ECR → AWS EKS → Helm → ALB → Public App


Infrastructure

AWS VPC with public/private subnets

Amazon EKS Cluster

Managed Node Group

AWS Load Balancer Controller

Amazon ECR Repository

CI/CD

GitHub Actions Pipeline

Automated Docker build & push

Automated Helm deployment to EKS

🧩 Tech Stack

Node.js – Application runtime

Docker – Containerization

Amazon ECR – Container registry

Terraform – Infrastructure as Code

Amazon EKS – Kubernetes cluster

Helm – Kubernetes package manager

GitHub Actions – CI/CD pipeline

AWS ALB – Public ingress load balancer

📂 Repository Structure
.
├── app/                   # Node.js Hello World application
├── Dockerfile             # Container build instructions
├── helm-chart/            # Helm chart for Kubernetes deployment
├── terraform/             # Terraform IaC for AWS infrastructure
└── .github/workflows/     # GitHub Actions CI/CD pipeline

⚙️ How It Works
1. Application

A simple Node.js Express server returning:

Hello, World!

2. Containerization

The app is containerized using Docker and stored in Amazon ECR.

3. Infrastructure (Terraform)

Terraform provisions:

VPC & networking

EKS cluster & node group

IAM roles & policies

ECR repository

4. Kubernetes Deployment (Helm)

Helm manages:

Deployment

Service

Ingress (ALB)

Horizontal Pod Autoscaler

5. CI/CD (GitHub Actions)

On every push to main:

Build Docker image

Push image to ECR

Update kubeconfig

Deploy to EKS using Helm

🌐 Live Application

Once deployed, the app is publicly accessible via AWS ALB:

http://<load-balancer-dns-name>


(Displayed in kubectl get ingress)

🔐 CI/CD Secrets Required

Configured in GitHub repository secrets:

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

AWS_REGION

ECR_REPO

EKS_CLUSTER_NAME

AWS_ACCOUNT_ID

🚀 Deployment Pipeline (GitHub Actions)

Pipeline steps:

Configure AWS credentials

Login to Amazon ECR

Build & push Docker image

Update kubeconfig

Deploy Helm chart to EKS

Fully automated continuous deployment.

📈 What This Project Demonstrates

✔ Infrastructure as Code (Terraform)
✔ Containerized application deployment
✔ Kubernetes orchestration
✔ Production-grade CI/CD
✔ Secure AWS IAM integration
✔ Automated cloud deployment

🧠 Next Improvements

HTTPS with ACM + Route53

OIDC IAM roles for GitHub Actions

Prometheus + Grafana monitoring

HPA autoscaling metrics

Blue/Green deployments

👨‍💻 Author

Adeoluwa Opadina
Cloud / DevOps Engineer
