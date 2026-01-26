🚀 Terraform Azure Reusable Infrastructure Modules

Enterprise-grade Azure Landing Zone using Terraform & Azure DevOps

📌 Overview

This repository provides production-ready, reusable Terraform modules to provision and manage Azure infrastructure at enterprise scale.
It follows Infrastructure as Code (IaC) best practices and is designed to support multi-environment deployments (Dev / Prod) with security, governance, and CI/CD automation baked in.

The goal of this project is to demonstrate how real-world organizations build and manage Azure Landing Zones using Terraform, modular design, and secure pipelines.

🎯 Key Objectives

- Build reusable & scalable Terraform modules for Azure

- Implement environment isolation (Dev / Prod) using workspaces

- Enforce security & compliance scanning in CI/CD

- Demonstrate enterprise Terraform pipeline design

- Follow Azure Landing Zone & DevSecOps best practices


🏗️ Architecture Overview

This repository follows a modular architecture:

terraform-azure-reusable-infra-modules
│
├── Generic_Infra_Modules/        # Reusable Terraform modules
│   ├── Virtual_Network
│   ├── Subnet
│   ├── Azure_Bastion
│   ├── AKS
│   ├── ACR
│   ├── Key_Vault
│   ├── Key_Vault_Secret
│   ├── Storage_Account
│   ├── SQL_Server
│   ├── SQL_DB
│   ├── Linux_Virtual_Machine
│   ├── NIC
│   ├── Public_IP
│   └── Resource_Group
│
├── Workspace/
│   ├── Env_Dev/                 # Dev environment configuration
│   └── Env_Prod/                # Prod environment configuration
│
├── toDo-Infra-pipeline.yml       # Azure DevOps CI/CD pipeline
└── README.md


🧱 Azure Resources Covered

✔️ Networking (VNet, Subnet, Public IP, NIC)
✔️ Compute (Linux Virtual Machines, AKS)
✔️ Security (Azure Bastion, Key Vault, Secrets)
✔️ Data & Storage (Storage Account, SQL Server, SQL DB)
✔️ Container Services (ACR, AKS)

All modules are loosely coupled, parameterized, and environment-agnostic.

🌍 Environment Strategy

✔️ Env_Dev → Development & testing

✔️ Env_Prod → Production workloads

✔️ Each environment has:

    - Its own variable files
    
    - Isolated Terraform state

    - Controlled deployment via pipeline approvals



🔐 CI/CD Pipeline – Azure DevOps

The pipeline (toDo-Infra-pipeline.yml) is designed as an enterprise-grade Terraform pipeline.

🔄 Pipeline Stages

1. Build

Terraform Init

Format, Validate & Plan

Publish Terraform Plan as Artifact

2. Security Scanning (DevSecOps)

🔍 Checkov

🔍 TFLint

🔍 TFSec

🔍 TerraScan

🔍 KICS

🔍 TruffleHog (Secrets Detection)

3. Manual Validation

Approval gate before applying infrastructure

4. Deploy

Terraform Apply (only after approval)

Controlled using pipeline parameters



🛡️ DevSecOps Highlights

- Security scans run before apply

- Pipelines allow soft-fail for visibility without blocking learning

- Secrets scanning prevents accidental credential leaks

- Manual approval gates protect production


🌱 Branching Strategy

- main → Production-ready infrastructure

- feature/* → New modules or enhancements

- dev/* → Experimental or development work

- PR validation enabled with plan & scan visibility


🛠️ Tech Stack

✔️ Terraform

✔️ Azure (VNet, AKS, VM, Key Vault, Bastion, SQL, Storage)

✔️ Azure DevOps Pipelines

✔️ Checkov, TFLint, TFSec, TerraScan, KICS

✔️ Git & GitHub


👩‍💻 Author

Bhabya Bharti
DevOps Engineer
Azure | Terraform | CI/CD | DevSecOps
