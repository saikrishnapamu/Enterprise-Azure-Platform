# Enterprise Azure Platform Architecture

## Goal

Provision Azure infrastructure using reusable Terraform modules and deploy through Azure DevOps pipelines.

## Current Architecture

```
Internet
     │
     ▼
Virtual Network
     │
 ┌───┴────┐
 │        │
Frontend Backend Database
```

## Components

- Resource Group
- Virtual Network
- Subnets
- Network Security Groups
- Linux Virtual Machine
- Storage Account
- Azure Key Vault
- Managed Identity

## Future Components

- Azure SQL
- AKS
- Application Gateway
- Azure Monitor
- Log Analytics
- Azure DevOps Pipeline
