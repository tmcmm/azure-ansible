# Ansible Project

This project is for creating multiple environment labs using Ansible

## How to

Change the variables.yml file accordingly to the variables you want to use.

### Pre-Requisites

- Having Ansible Installed >= 2.9.6
- Create an SP (Service Principal) capable of creating the Azure Objects
- Create the file credentials inside /home/user/.azure/

Creating SP:
```
az ad sp create-for-rbac --name svc-ansible-azure --password 'ALovelyComplexPasswor@'
```
list your subscription:
```
az account list (for listing the subscriptionID)
```
AZURE_SUBSCRIPTION_ID ==> subscription_id
AZURE_CLIENT_ID ==> appId
AZURE_SECRET ==> password
AZURE_TENANT ==> tenant


credentials file:
```
[default]
subscription_id=10dfa491-xxxxx-xxxx-a4ee-9aeb49b8c00e
client_id=db93c95c-xxxx-4cb7-xxxx-773baa4cddef
secret=xxxxxxxxx.O_-e3vWPb-iKAeM
tenant=72f988bf-xxxx-41af-xxxx-2d7cd011db47
```

### Run the playbooks

```
ansible-playbook playbook_name.yml
```

Delete resource-groups:
```
ansible-playbook delete_rg.yml --extra-vars "name=resource_group_name"
```