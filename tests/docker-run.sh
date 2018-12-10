#!/bin/bash
# exit if any command fails
set -e

ansible-playbook tests/test.yml -i tests/inventory --syntax-check
ansible-playbook tests/test.yml -i tests/inventory
curl -i -s --insecure --data "user=ncadmin&password=" https://localhost/index.php/login | egrep -q "Location:.*/apps/files/"