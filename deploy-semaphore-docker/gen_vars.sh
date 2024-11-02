#!/bin/bash

# Generate a random SEMA_ACCESS_KEY
SEMA_ACCESS_KEY=$(head -c32 /dev/urandom | base64)

# Define variables
MYSQL_USER="root_sema"
MYSQL_PASS="lsnHDs834ks7shnH7_TOCHANGE"
SEMA_ADMIN_USER="adminTOCHANGE"
SEMA_ADMIN_PASS="TOCHANGE1234"
SEMA_ADMIN_EMAIL="admin@example.com"

# Create the Ansible variables file
mkdir vars
cat <<EOL > ./group_vars/all/ansible_vars.yml
---
MYSQL_USER: "$MYSQL_USER"
MYSQL_PASS: "$MYSQL_PASS"
SEMA_ADMIN_USER: "$SEMA_ADMIN_USER"
SEMA_ADMIN_PASS: "$SEMA_ADMIN_PASS"
SEMA_ADMIN_EMAIL: "$SEMA_ADMIN_EMAIL"
SEMA_ACCESS_KEY: "$SEMA_ACCESS_KEY"
EOL

echo "Ansible variables have been generated in ./group_vars/all/ansible_vars.yml"
