# Basic Infrastructure Configuration with Terraform

## Overview

This repository contains Terraform code for configuring the basic networking infrastructure required for a Kubernetes (K8s) cluster on AWS. It includes the setup of a VPC, public and private subnets, an Internet Gateway, and routing configurations to facilitate communication within the VPC and to the outside world, NAT gateway, a bastion host t manage the resources.

## Prerequisites

- Terraform installed on your local machine.
- An AWS account with appropriate permissions to create VPCs, subnets, and other resources.
- AWS CLI configured with your credentials.

## Configuration

### Variables

All configurable parameters are stored in the `variables.tf` files located in the respective module directories and the root directory.

### Resources

1. **VPC**: The main VPC is created to host all resources.
2. **Public Subnets**: Two public subnets are created in different Availability Zones (AZs).
3. **Private Subnets**: Two private subnets are created in different AZs.
4. **Internet Gateway**: An Internet Gateway is set up for public access.
5. **Routing Configuration**:
  - Routing tables are configured to allow instances in all subnets to communicate with each other.
  - Public subnets can reach the outside world through the Internet Gateway.
  - Private subnets can access the Internet via a NAT Gateway.

## Deployment

To deploy the infrastructure, follow these steps:

1. **Initialize Terraform**:
   ```bash
   terraform init

2. **Plan the Deployment**:
   ```bash
   terraform plan

3. **Apply the Configuration**:
   ```bash
   terraform apply


## Security Groups and Bastion Host

Security groups are defined in the `security_groups` module. A bastion host is created for secure access to instances in the private subnets.

## NAT Configuration

A NAT Gateway is configured for instances in the private subnets to access the Internet.

## GitHub Actions (Optional)

There is set GitHub Actions pipeline for automated deployments.
   
   
   
