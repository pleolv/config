#!/bin/bash

set -x

rpm -ivh https://yum.puppetlabs.com/el/7/products/x86_64/puppetlabs-release-7-11.noarch.rpm

yum install -y puppet-server

systemctl start  puppetmaster.service

yum install -y puppet


