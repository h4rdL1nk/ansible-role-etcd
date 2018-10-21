# Ansible role for Docker CE installation ( molecule driven tests )

This role installs and configure docker community-edition with devicemapper storage driver.

The ```molecule.yml``` file has been modified to add an additional disk for docker storage only.

## General module testing procedure

### Export required variables
```
MOLECULE_EPHEMERAL_DIRECTORY="${PWD}/.molecule" 

export MOLECULE_EPHEMERAL_DIRECTORY
```

### Launch molecule role testing commands
```
molecule create
molecule converge
molecule idempotence
molecule destroy
```

### Launch complete molecule test
```
molecule test
```
