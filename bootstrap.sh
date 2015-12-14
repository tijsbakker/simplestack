#!/usr/bin/env bash

echo "Installing python-m2crypto"
aptitude -y install python-m2crypto

echo "Creating symbolic links for salt root and pillar folder"
ln -s /home/ubuntu/sites/simplestack/salt/roots/ /srv/salt
ln -s /home/ubuntu/sites/simplestack/salt/pillar/ /srv/pillar
