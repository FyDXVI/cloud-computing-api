
# Projet d'Infrastructure et Déploiement Continu sur Azure

## Description du projet

Ce projet a pour objectif de provisionner une infrastructure sur Azure pour une API HTTP existante, tout en implémentant un pipeline CI/CD via GitHub Actions. L'infrastructure est gérée via Terraform et déployée automatiquement grâce à des workflows CI/CD. L'API HTTP exposera plusieurs endpoints avec des interactions avec une base de données et un stockage en Blob. Le projet couvre les technologies suivantes :

- **Terraform** pour le provisionnement de l'infrastructure
- **Azure** pour les ressources cloud (App Service, Base de données, Blob storage, etc.)
- **GitHub Actions** pour l'intégration et le déploiement continu

## Objectifs

Le projet consiste à :
1. Provisionner l’infrastructure nécessaire sur Azure :
    - Azure App Service
    - Azure Database
    - Azure Blob Storage
    - Et autres ressources pertinentes (réseau virtuel, etc.)
2. Créer un pipeline CI/CD avec GitHub Actions :
    - Tester le code lors de la création d’une pull request
    - Construire et publier une image Docker à chaque fusion dans la branche `main`
    - Déployer l'image Docker sur Azure App Service

## Structure du projet

- `/infrastructure/` : Contient le code Terraform pour provisionner l'infrastructure sur Azure.
- `/.github/` : Contient les workflows GitHub Actions pour CI/CD.

## Équipe

Le projet a été réalisé par les membres de l'équipe suivante :
- **Mathieu Bral**
- **Justin Martin**
- **Pierre Bouchardons**
- **Fayad Daher**

## Fonctionnalités de l'API

L'API HTTP possède plusieurs endpoints :
1. **`/`** : Endpoint public.
2. **`/examples`** : Récupère des enregistrements depuis la base de données PostgreSQL.
3. **`/quotes`** : Retourne des données depuis un fichier JSON stocké sur Azure Blob Storage.

## CI/CD

Le pipeline CI/CD est conçu pour effectuer les actions suivantes :
1. **Tests automatiques** : Exécutés lors de la création d'une pull request.
2. **Build Docker** : Lors de la fusion dans `main`, l'image Docker est construite et publiée sur un registre Docker.
3. **Déploiement** : L'image Docker est déployée sur Azure App Service.

## Infrastructure-as-Code

L'infrastructure est entièrement déclarée via Terraform, et est modulaire. Vous pouvez facilement déployer cette infrastructure en exécutant `terraform apply` après avoir renseigné les variables nécessaires.

### Modules Terraform
Les modules Terraform sont organisés pour faciliter le déploiement et la maintenance de l'infrastructure. Chaque ressource est définie de manière modulaire.

## Sécurité

Des mesures de sécurité sont prises pour s'assurer que les ressources sont correctement configurées :
- La base de données n'est pas exposée publiquement.
- Toutes les ressources sont placées dans un subnet dédié privé.
- Les secrets ne sont pas visibles dans le dépôt Git.

## Documentation

Le projet est documenté de manière à permettre à un autre développeur de comprendre rapidement l'architecture et les choix techniques effectués.

## Ressources

Pour en savoir plus sur certaines des technologies utilisées, consultez les ressources suivantes :
- [GitHub Actions](https://docs.github.com/en/actions)
- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [New Relic](https://newrelic.com/pricing)

## Conclusion

Le projet est une mise en pratique des concepts de CI/CD, de Terraform et de gestion d'infrastructure sur Azure. Il offre une expérience concrète pour le déploiement d'applications dans le cloud avec un haut niveau d'automatisation.
