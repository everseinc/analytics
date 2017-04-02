#!/bin/sh



###
## set env
#

echo 'export COMPOSE_FILE="docker-compose.development.yml"' >> ~/.bashrc
echo 'Defaults    env_keep += "COMPOSE_FILE"' | sudo tee --append /etc/sudoers > /dev/null

###
## reset
#

source ~/.bashrc