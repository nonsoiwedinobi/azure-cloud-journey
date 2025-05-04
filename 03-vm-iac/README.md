# Project 03 - Deploying a Virtual Machine Using Infrastructure as Code (IaC) on Azure

This project demonstrates how to deploy an Azure Virtual Machine using three different Infrastructure as Code (IaC) approaches:

* ARM Template

* Bicep

* Terraform

Each method deploys resources into an existing Azure Resource Group and follows a clear process from authoring the template to executing the deployment.

## Create a Resource Group

Before deploying resources, a dedicated resource group was created to organize all infrastructure components:

![alt text](image.png)

## Create ARM Template

The ARM template defines the VM, network interface, virtual network, subnet, and public IP.

![alt text](image-1.png)

## Deploy the ARM Template

Deployed via the Azure Cloud Shell 

![alt text](image-2.png)

## Create Bicep File

Used Bicep syntax to simplify and improve readability of the ARM template.

![alt text](image-5.png)

## Upload the File to Cloud Shell

![alt text](image-4.png)

## Deploy the Bicep File

![alt text](image-6.png)

## Create a Terraform File

Terraform configuration included:

* Azure provider configuration

* Virtual network and subnet

* Public IP and NIC

* VM definition using azurerm_virtual_machine

![alt text](image-9.png)

## Upload to cloud shell

![alt text](image-8.png)

## Initialize and Deploy 

![alt text](image-10.png)

![alt text](image-11.png)

![alt text](image-12.png)

## Final Result: All VMs Successfully Deployed

All three approaches deployed Azure VMs within the same resource group, demonstrating how versatile and powerful Infrastructure as Code can be.

### VM Overview

![alt text](image-13.png)

## Learnings

* Gained hands-on experience with all three IaC tools

* Learned how to debug deployment issues via Azure CLI and logs

* Practiced modular and reusable template design

* Reinforced understanding of Azure networking components