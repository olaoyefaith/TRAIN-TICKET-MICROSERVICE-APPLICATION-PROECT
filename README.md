# TRAIN-TICKET-MICROSERVICE-APPLICATION-PROJECT

The Train Station Application is a comprehensive microservices-based application that has been meticulously crafted using a variety of programming languages, including Java, Go, Python, and Node.js. This project is designed to serve as a real-world demonstration of the critical role that DevOps plays in a production environment. Throughout the development of this application, core DevOps principles such as automation, infrastructure management etc.have been implemented to showcase their practical application and value.

## Technologies:
Terraform,Github Actions,Docker,Node.js,AZURE,AKS,MONGODB,MYSQL

## Key Project Elements
1. **Microservices Architecture**: The Train Station Application is built as a collection of microservices, fostering flexibility and scalability.

2. **Continuous Integration and Continuous Deployment (CI/CD)**: GitHub Actions, a robust CI/CD platform, has been used to automate the build, test, and deployment processes. This approach enables the rapid delivery of code changes while maintaining quality and stability.

3. **Infrastructure as Code (IaC)**: Terraform scripts provision the essential infrastructure components on the Azure cloud platform, including Azure Kubernetes Cluster, Azure container registry, MySQL, and Postgres databases. IaC ensures consistency and efficiency.

4. **Database Management**:  MySQL and Mongodb are integrated into the application to demonstrate the management of different database systems within the DevOps framework.

5. **Kubernetes Deployment**: The Train Station Application is deployed using Kubernetes. Manifest files define the desired state of the application, enabling efficient container orchestration and management in a containerized environment.

## Tasks:
1. Automate Build, Test and Deploy Application as Containers to Dockerhub.

 Directory: .github/workflows/dockerbuild.yml

2. Write Terraform Configurations For deployment eg AKS, POSTGRES, SQL and Set Backend to AZURE.

 Directory: infra/

3. Automate Infrastructure Provisioning Using Github Actions While Ensuring Sensitive data Protection by Using Environment Variable.

 Directory: .github/workflows/terraformiac.yml

4. Write Manifest Files to deploy K8s including deployment,service,statefulset and ingress etc.

  Directory: deployment/


## Overall Objective:

The primary goal of the Train Station Application project is to provide a tangible representation of how DevOps practices can enhance the software development and deployment process. By emphasizing automation, infrastructure management through IaC and Kubernetes for container orchestration the project illustrates how DevOps practices can lead to greater efficiency, faster delivery, and higher quality software products in a real-world, production-based setting.
