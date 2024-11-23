
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
    - Deploying the Docker image on Azure App Service

## Project Structure

- `/infrastructure/` : Contains Terraform code for provisioning the infrastructure on Azure.
- `/.github/` : Contains GitHub Actions workflows for CI/CD.

## Team

This project was developed by the following team members:
- **Mathieu Bral**
- **Justin Martin**
- **Pierre Bouchardons**
- **Fayad Daher**

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

### Terraform Modules
The Terraform modules are organized to simplify deployment and maintenance. Each resource is defined in a modular way.

## Security

Security measures are implemented to ensure proper resource configuration:
- The database is not exposed publicly.
- All resources are placed in a private dedicated subnet.
- Secrets are not visible in the Git repository.

## Documentation

The project is documented to allow another developer to quickly understand the architecture and the technical decisions made.

## Functional Architecture 
![image](https://github.com/user-attachments/assets/35285d34-e489-40f6-a763-ff0a17987f57)

## Resources

To learn more about some of the technologies used, refer to the following resources:
- [GitHub Actions](https://docs.github.com/en/actions)
- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)

## Conclusion

This project serves as a practical implementation of CI/CD concepts, Terraform, and infrastructure management on Azure. It provides hands-on experience in deploying cloud applications with a high level of automation.
