#!/bin/bash

rm -v -R /media/stryker/DevOps/site/sites/venture/public_html/*
rm -v -R /media/stryker/DevOps/site/venture/ground-control/memcached/*
rm -v -R /media/stryker/DevOps/site/venture/ground-control/scripts/*
rm -v -R /media/stryker/DevOps/site/venture/ground-control/ws-apps/*
rm -v -R /media/stryker/DevOps/site/venture/ground-control/mysql-cluster-data/conf/*
rm -v -R /media/stryker/DevOps/site/venture/ground-control/mysql-cluster-data/scripts/*
rm -v -R /media/stryker/DevOps/site/venture/ground-control/sec-keys/*

cp -v -R /home/stryker/sites/venture/public_html/* /media/stryker/DevOps/site/sites/venture/public_html/
cp -v -R /home/stryker/venture/ground-control/memcached/* /media/stryker/DevOps/site/venture/ground-control/memcahced/
cp -v -R /home/stryker/venture/ground-control/scripts/* /media/stryker/DevOps/site/venture/ground-control/scripts/
cp -v -R /home/stryker/venture/ground-control/ws-apps/* /media/stryker/DevOps/site/venture/ground-control/ws-apps/
cp -v -R /home/stryker/venture/ground-control/mysql-cluster-data/conf/*  /media/stryker/DevOps/site/venture/ground-control/mysql-cluster-data/conf/*
cp -v -R /home/stryker/venture/ground-control/mysql-cluster-data/scripts/*  /media/stryker/DevOps/site/venture/ground-control/mysql-cluster-data/scripts/
cp -v -R /home/stryker/venture/ground-control/sec-keys/* /media/stryker/DevOps/site/venture/ground-control/sec-keys/

printf "\n Backup Complete... \n"

exit 0
