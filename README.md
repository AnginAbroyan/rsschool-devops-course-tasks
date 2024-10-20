# k3s Kubernetes Cluster on AWS

## Overview

This project outlines the process of setting up a lightweight Kubernetes (k3s) cluster on AWS, managing the infrastructure using Terraform, and verifying the cluster by deploying a simple workload. The k3s distribution is ideal for smaller clusters due to its reduced resource requirements and simplified configuration. We will set up EC2 instances for master and worker nodes, accessible via a bastion host.

## Deploy the Necessary Infrastructure

The infrastructure required for the project, including the VPC, subnets, security groups, and EC2 instances (Bastion Host, k3s_master, and k3s_worker), is created using Terraform. To provision the resources, follow these steps:

1. `terraform init`
2. `terraform plan`
3. `terraform apply`

This will set up all necessary AWS components. Once the infrastructure is in place, connect to the k3s_master node through the Bastion Host to install k3s.

1. SSH into the k3s_master via the Bastion Host:
   `ssh -i "ssh-key.pem" -J ec2-user@<bastion-public-ip> ec2-user@<master-private-ip>`

2. Install k3s on the Master Node:
   `curl -sfL https://get.k3s.io | sh -`

3. Retrieve the Token for Worker Node Setup:
   `sudo cat /var/lib/rancher/k3s/server/node-token`

## Join the Worker Node to the Cluster

1. SSH into the k3s_worker via the Bastion Host:
   `ssh -i "ssh-key.pem" -J ec2-user@<bastion-public-ip> ec2-user@<worker-private-ip>`

2. Install k3s on the Worker Node to connect it to the cluster:
   `sudo curl -sfL https://get.k3s.io | K3S_URL=https://<master-private-ip>:6443 K3S_TOKEN=<token> sh -`

## Deployment Process

### Establish an SSH Tunnel to Access the Cluster

To manage the Kubernetes cluster from your local machine, set up an SSH tunnel through the Bastion Host, forwarding traffic to the k3s_master node.

1. Create an SSH Tunnel:
   `ssh -i "ssh-key.pem" -L 6443:<master-private-ip>:6443 ec2-user@<bastion-public-ip>`

This will forward local port 6443 to the Kubernetes API server on the k3s_master node. Keep the terminal open to maintain the tunnel connection.

### Deploy a Workload on the Cluster

1. In a new terminal, deploy a sample pod:
   `kubectl apply -f https://k8s.io/examples/pods/simple-pod.yaml`

2. Check the Pod status:
   `kubectl get pods`

3. Verify the Cluster Nodes:
   `kubectl get nodes`
