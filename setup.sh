#!/bin/sh



###
## set env
#

echo "export RAILS_ENV=development" >> ~/.bashrc

# if you want to set up on production, you should set under commands
# 
# echo "export RAILS_ENV=production" >> ~/.bashrc
# echo "export PROD_DATABASE_URL=mysql2://everse:{{password}}@db:3306" >> ~/.bashrc



###
## reset
#

source ~/.bashrc