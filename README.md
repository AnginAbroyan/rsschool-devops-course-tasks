# Task 2: Basic Infrastructure Configuration

## Objective
This task focuses on creating Terraform code to configure the basic networking infrastructure required for a Kubernetes (K8s) cluster. The goal is to set up a Virtual Private Cloud (VPC) with public and private subnets, appropriate routing configurations, and security measures.

## Infrastructure Overview
The Terraform code provided in this repository configures the following resources:

- **VPC**: A Virtual Private Cloud for isolating the Kubernetes cluster.
- **Subnets**:
    - 2 public subnets across two different availability zones (AZs).
    - 2 private subnets across two different availability zones.
- **Internet Gateway**: Allows internet access for resources in the public subnets.
- **Routing Configuration**:
    - Instances in all subnets can communicate with each other.
    - Instances in public subnets can access the internet and accept connections from the outside.
- **Security Groups**: Restrict inbound and outbound traffic according to defined rules.
- **Bastion Host**: Provides secure access to instances in private subnets.
- **NAT Gateway/Instance**: Enables instances in private subnets to access the internet.

## Steps to Set Up

### 1. Write Terraform Code
The Terraform configuration includes:
- **VPC creation**.
- **Public and private subnets**.
- **Internet Gateway**.
- **Route tables** to allow communication between instances and external traffic for public subnets.

### 2. Code Organization
The Terraform code is split across several files for better organization:
- **main.tf**: Contains the primary resource definitions.
- **variables.tf**: All input variables are defined here.
- **outputs.tf**: Specifies the output variables for the configuration.

### 3. Verify the Configuration
To verify the setup, run the following Terraform commands:

```bash
terraform init
terraform plan