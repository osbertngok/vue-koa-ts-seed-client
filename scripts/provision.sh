#!/usr/bin/env bash

CURR_FILE_DIR=`dirname $0`
PROJECT_DIR=${CURR_FILE_DIR}/..

ansible-playbook -i ${PROJECT_DIR}/ansible/inventory.yml -e "ansible_ssh_user=root" ${PROJECT_DIR}/ansible/provision.yml --limit ops_web

