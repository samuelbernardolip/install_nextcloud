#!/bin/bash
# exit if any command fails
set -e

ansible-playbook test.yml -i inventory --syntax-check
ansible-playbook test.yml -i inventory
curl -i -s --insecure --data "user=ncadmin&password=" https://localhost/index.php/login | egrep -q "Location:.*/apps/files/"