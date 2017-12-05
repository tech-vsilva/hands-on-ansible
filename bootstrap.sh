#!/bin/bash

set -x

if [[ $(uname --all > /dev/null) == *"Ubuntu"* ]]; then
  dpkg --list | grep ansible > /dev/null
  is_ansible_installed=$(echo $?)

  if [[ ! is_ansible_installed ]]; then
      sudo apt-get update
      sudo apt-get install -y software-properties-common
      sudo apt-add-repository -y ppa:ansible/ansible
      sudo apt-get update
      sudo apt-get install -y ansible
      ansible --version
  fi
else
  if [[ $(uname --all > /dev/null) == *"el7"* ]]; then
    sudo yum update
    sudo yum install -y epel-release
    sudo yum install -y ansible
    ansible --version
  fi
fi
