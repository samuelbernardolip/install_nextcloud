#!/bin/bash
# exit if any command fails
set -e

printf '[defaults]\nroles_path=%s/' "$1" >ansible.cfg

ansible-playbook $1/test.yml -i inventory --syntax-check
ansible-playbook $1/test.yml -i inventory
curl -i -s --insecure --data "user=ncadmin&password=" https://localhost/index.php/login | egrep -q "Location:.*/apps/files/"