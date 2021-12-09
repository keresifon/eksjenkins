# eksjenkins
A four stage pipeline to provision AWS resources for an EKS cluster 

1. Provisioning the infrastructure using terraform to create the Amazon EKS cluster and deploy worker nodes 
2. Creating an IAM Policy for the AWS Load Balancer Controller, creating an IAM role with the policy attached and annotate the Kubernetes service account for the AWS Load Balancer Controller 
3. Installing the AWS Load Balancer Controller using helm
4. Deploying the application containers on the Kubernetes cluster

Using GitHub Actions https://github.com/keresifon/eksjenkins/tree/main/.github/workflows

Using Jenkins Jenkinsfile (in the main branch)
