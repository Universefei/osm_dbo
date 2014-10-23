#!/usr/bin/env bash

set -x
## ========================================================================= ##
##                          Add repoes into yum.repo.d                       ##
## ========================================================================= ##

# PostgreSQL 9.2 Repo
sudo rpm -i http://yum.postgresql.org/9.2/redhat/rhel-6-x86_64/pgdg-centos92-9.2-6.noarch.rpm

# PostGIS repo
sudo rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6

sudo yum clean all
sudo yum makecache
sudo yum update

## ========================================================================= ##
##                     download gdal and compile it                          ##
## ========================================================================= ##
echo "Starting download gdal-1.11.1"
curl http://download.osgeo.org/gdal/CURRENT/gdal-1.11.1.tar.gz -o gdal-1.11.1.tar.gz --progress
if [[ $? == 0 ]];then
    tar -zxvf gdal-1.11.1.tar.gz
    cd gdal-1.11.1
    ./configure --prefix=/usr/local
    make
    sudo make install
else
    exit
fi

## ========================================================================= ##
##                          install PostgreSQL and PostGIS                   ##
## ========================================================================= ##

sudo yum install postgresql92-server postgresql92-contrib
sudo yum install postgis2_92.x86_64

## ========================================================================= ##
##                          create test spatial db                           ##
## ========================================================================= ##
sudo -u postgres psql -c "create database test";
sudo -u postgres psql -d test -c "create extension postgis";

## ========================================================================= ##
##                          configure postgresql                             ##
## ========================================================================= ##

su - postgresql
pg-ctl restart

