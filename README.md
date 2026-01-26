### 🚀 Azure Enterprise Landing Zone with Terraform (DevSecOps-Ready) ###

## 📌 Overview

This repository implements a production-ready Azure Enterprise Landing Zone using Terraform, designed to provision and manage secure, scalable, and multi-environment cloud infrastructure.

It reflects real-world enterprise patterns used in regulated industries such as banking, fintech, and large enterprises.

Key Highlights

- Modular Infrastructure as Code (IaC)

- Environment isolation (Dev / UAT / Prod)

- Secure networking foundations

- Kubernetes-ready platform (AKS + ACR)

- DevSecOps-enabled CI/CD pipelines

- Approval-based infrastructure deployments

### 🏗️ High-Level Architecture 

## Platform Design Principles

- Modular Terraform architecture

- Reusable infrastructure components

- Environment-level isolation

- Secure-by-default configurations

- Automation with governance controls

## ☁️ Core Azure Services Provisioned

- Resource Groups

- Virtual Networks & Subnets

- Network Interfaces (NICs) & Public IPs

- Azure Bastion (secure access)

- Azure Key Vault & Secrets

- Azure SQL Server & Databases (PaaS)

- Linux Virtual Machines

- Azure Kubernetes Service (AKS)

- Azure Container Registry (ACR)

📁 Repository Structure
azure-enterprise-landing-zone-terraform/
│
├── Generic_Infra_Modules/
│   ├── Resource_Group/
│   ├── Virtual_Network/
│   ├── Subnet/
│   ├── Public_IP/
│   ├── NIC/
│   ├── Azure_Bastion/
│   ├── Key_Vault/
│   ├── Key_Vault_Secret/
│   ├── SQL_Server/
│   ├── SQL_DB/
│   ├── Linux_Virtual_Machine/
│   ├── AKS/
│   └── ACR/
│
├── Workspace/
│   ├── Env_Dev/
│   ├── Env_UAT/
│   └── Env_Prod/
│
├── toDo-Infra-pipeline.yml
└── README.md

## 🌍 Multi-Environment Strategy

## Each environment (Dev, UAT, Prod) is:

- Fully isolated

- Has its own Terraform state

- Uses separate backend configuration

- Deployed via environment-specific pipelines

This ensures safe promotions, reduced blast radius, and compliance alignment.

## 🔐 Security & Governance (DevSecOps)

## Integrated Security Controls

- Checkov – IaC policy scanning

- TFLint – Terraform best practices

- Tfsec – Security misconfiguration detection

- Terrascan – Compliance as code

- KICS – Infrastructure vulnerability scanning

- TruffleHog – Secrets detection

All scans run automatically during PR validation.

## 🔄 CI/CD Pipeline – Infrastructure (Azure DevOps)

The toDo-Infra-pipeline.yml implements an enterprise-grade Terraform pipeline.

## Pipeline Capabilities

🔹 Trigger Strategy

- Runs on main, feature/*, dev/*

- Path-based execution for environment isolation

- Separate PR validation pipelines

🔹 Build Stage

- Terraform install

- terraform init

- terraform fmt

- terraform validate

- terraform plan

- Plan artifact publishing

🔹 Scan Stage

- Parallel security scans (Checkov, Tfsec, TFLint, KICS, Terrascan, TruffleHog)

- Non-blocking scans for visibility

- Artifacts published for audit

🔹 Manual Validation

- Approval gates before apply

- Enforced reviewer validation

🔹 Deploy Stage

- Controlled terraform apply

- Environment-aware execution

- Remote backend with state locking

☸️ Kubernetes & Container Platform

This landing zone is Kubernetes-ready and supports:

- AKS cluster provisioning

- Node pools with VMSS

- Private networking

- ACR integration for image pulls

- Secure workload identity

- Ready for microservices deployments

Designed for:

- Cloud AKS

- Hybrid & on-prem Kubernetes workloads

📈 Observability & Operations

- Designed for integration with:

- Azure Monitor

- Log Analytics

- Prometheus

- Grafana

Enables real-time monitoring across:

- VMs

- AKS clusters

- Network & platform services



👤 Author

Bhabya Bharti
DevOps / Cloud Engineer
Specialized in Terraform, Azure, Kubernetes, CI/CD, and DevSecOps

📎 Detailed architecture and implementation patterns are reflected in my pinned repositories.
