#!/bin/bash

cp -v -R /home/stryker/sites/venture/public_html/* /media/stryker/DevOps/site/sites/venture/public_html/ 
cp -v -R /home/stryker/venture/ground-control/memcached/* /media/stryker/DevOps/site/venture/ground-control/memcahced/*
cp -v -R /home/stryker/venture/ground-control/scripts/* /media/stryker/DevOps/site/venture/ground-control/scripts/*
cp -v -R /home/stryker/venture/ground-control/ws-apps/* /media/stryker/DevOps/site/venture/ground-control/ws-apps/*
cp -v -R /home/stryker/venture/ground-control/mysql-cluster-data/conf  /media/stryker/DevOps/site/venture/ground-control/mysql-cluster-data/conf
cp -v -R /home/stryker/venture/ground-control/mysql-cluster-data/scripts  /media/stryker/DevOps/site/venture/ground-control/mysql-cluster-data/scripts  

printf "\n Backup Complete... \n"

exit 0
