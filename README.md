# Acknowledgments

We would like to give special thanks to Louis SKRZYPCZAK for developing the CI/CD pipeline code. His contributions were essential in implementing the automated deployment process.
We would also like to acknowledge his help throughout the development process in helping us on our blocking point.

# Infrastructure and Continuous Deployment Project on Azure

## Project Description

This project aims to provision an infrastructure on Azure for an existing HTTP API while implementing a CI/CD pipeline using GitHub Actions. The infrastructure is managed with Terraform and automatically deployed through CI/CD workflows. The HTTP API will expose several endpoints interacting with a database and Blob storage. The project incorporates the following technologies:

- **Terraform** for infrastructure provisioning
- **Azure** for cloud resources (App Service, Database, Blob Storage, etc.)
- **GitHub Actions** for continuous integration and deployment

## Objectives

The project involves:
1. Provisioning the required infrastructure on Azure:
    - Azure App Service
    - Azure Database
    - Azure Blob Storage
    - Other relevant resources (e.g., virtual network)
2. Creating a CI/CD pipeline with GitHub Actions:
    - Testing the code upon creating a pull request
    - Building and publishing a Docker image with each merge into the `main` branch

## Project Structure

- **`/infrastructure/`** : Contains Terraform code for provisioning the infrastructure on Azure.
- **`/.github/`** : Contains GitHub Actions workflows for CI/CD.
- **`/examples/`** : Contains the code of the HTTP API

## Team

This project was developed by the following team members:
- **Pierre BOUCHAUDON**
- **Mathieu BRAL**
- **Fayad DAHER**
- **Justin MARTIN**

## API Features

The HTTP API provides several endpoints:
1. **`/`** : Public endpoint.
2. **`/examples`** : Retrieves records from the PostgreSQL database.
3. **`/quotes`** : Returns data from a JSON file stored in Azure Blob Storage.

## CI/CD

The CI/CD pipeline is designed to perform the following actions:
1. **Automated Tests**: Triggered upon the creation of a pull request.
2. **Docker Build**: Builds and publishes the Docker image to a Docker registry when changes are merged into `main`.
3. **Deployment**: Deploys the Docker image to Azure App Service.

## Infrastructure-as-Code

The infrastructure is fully declared using Terraform and is modular. You can easily deploy this infrastructure by running `terraform apply` after configuring the necessary variables.
It is also possible to add any necesary module to the infrastructure while using some bricks of the current project.

### Terraform Modules
The Terraform modules are organized to simplify deployment and maintenance. Each resource is defined in a modular way.

## Security

Security measures are implemented to ensure proper resource configuration:
- The database is not exposed publicly.
- All resources are placed in a dedicated subnet.
- Secrets are not visible in the Git repository.

## How to Launch the Project

To launch this project, follow the steps below:

1. Fork the repository from GitHub:  
2. Navigate to the infrastructure folder
3. Provide the necessary configuration by populating the terraform.tfvars (see terraform.tfvars.example) file with your environment-specific values. This file should include variables such as Azure credentials, resource names, database credentials other required details.
4. Initialize terraform with the command `terraform init` then `terraform apply` to deploy the project. This step can take several minutes.
5. The URL of the application can be retrieved in the outputs under the name of `app_service_fqdn`

## Functional Architecture 

![image](https://github.com/user-attachments/assets/35285d34-e489-40f6-a763-ff0a17987f57)

Placing each resource in its own dedicated subnet within a Virtual Network (VNet) offers several benefits, mainly related to security, traffic management, and infrastructure organization.
Each resource (e.g., databases, web apps, storage services) has specific networking needs. It makes it possible to apply more granular security with stricter and specific access controls (for instance keeping the database and storage private). It also makes it easier to manage traffic flow between resources. Having dedicated subnets also ensures a better maintenance and scalibility without impacting the rest of the network.

## Resources

To learn more about some of the technologies used, refer to the following resources:
- [GitHub Actions](https://docs.github.com/en/actions)
- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)

## Conclusion

This project serves as a practical implementation of CI/CD concepts, Terraform, and infrastructure management on Azure. It provides hands-on experience in deploying cloud applications with a high level of automation.
