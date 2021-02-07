# artifactory
The artifactory role will install artifactory software.

### Role Variables
All the local file should be located in files directory.
* local_artifactory_rpm: this is the artifactory local rpm which want to install.
* db_local_location : this is the right db jdbc driver. 

**THIS SHOULD NOT BE USED FOR PRODUCTION.**


## Example Playbook
```
---
- hosts: artifactory
  roles:
    - artifactory
```
