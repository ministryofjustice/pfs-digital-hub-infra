Terraform for Hub servers
=======================

What is not managed here
---------------
Any network configuration to the core PFS network. Such as;
VNETS
Subnets
Firewall (NSG)
VPN

These are all maintained in the pfs-infrastructure repo.

Set up Terraform
---------------

You will need;

- Install Terraform. https://www.terraform.io/downloads.html - Modules are currently TF 0.12
- Contribute Permissions on the PFS Azure Subscription (See Web Ops for PFS)
- The ARM_ACCESS_KEY env var setting up locally. This can be found in the PFS Key Vault for obtain from Web Ops. This is different per environment, prod, stage, dev.
- Az login running from your terminal.


Terrform Modules split, understanding the repo.
---------------	

This repo is split into multiple sections. Depending on what you want to change depends on the folder you cd into.

ACR (Azure Container Registry)
---------------	
Module specific for the ACR components. Any changes here will only impact that service. Currently only used for Matomo.
Module only has one environment, production.

Content-Share
---------------	
Module specific to the content share holding all the Azure storage for the hub. Video's images, audio etc. Changes in here to the drupal access account or network ingres to the storage are completed here.

Recovery Services
---------------	
Module specific to the backups and service restore config. Any modification here impacts all sub modules.

Vault
---------------	
Module specific to the Azure Vault services for the hub and access control surrounding it.

VM-Environments
---------------	
- Dev
- Stage
- Prod

As above this is specific to building VM's per environment. These are split as per the folders. Thus to amend Dev environment cd into the Dev folder. You will need the correct `ARM_ACCESS_KEY` defined on your local system for each `ENV` or the terraform will fail. 

Running the Terraform
---------------

Once changes are made and you are happy to run in the relevant environment.  There are no need for specific ENV vars in this set of modules unlike the pfs-infra repo.

In Terminal;
- Make sure you have the correct `ARM_ACCESS_KEY ` for the `ENV` you wish to amend.
- Run `Terraform Validate` against the code. This wil confirm the code is sound and legible.
- Run `Terraform Plan` - This will plan out the changes, listing all the changes in the code and what impact. This must be checked before going any further.
- Run `Terraform Apply` which will run a plan before hand and then ask you to confirm. You can bypass this with `Terraform Apply --auto-approve` 

- To destroy and environment and all configuration. `Terraform Destroy` is to be used. But only in the event of a decomission of configuration or services.

