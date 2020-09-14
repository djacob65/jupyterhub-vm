#!/usr/bin/env bash
# To use an OpenStack cloud you need to authenticate against the Identity
# service named keystone, which returns a **Token** and **Service Catalog**.
# The catalog contains the endpoints for all services the user/tenant has
# access to - such as Compute, Image Service, Identity, Object Storage, Block
# Storage, and Networking (code-named nova, glance, keystone, swift,
# cinder, and neutron).
#
# *NOTE*: Using the 3 *Identity API* does not necessarily mean any other
# OpenStack API is version 3. For example, your cloud provider may implement
# Image API v1.1, Block Storage API v2, and Compute API v2.0. OS_AUTH_URL is
# only for the Identity API served through keystone.

# *Remark*: You can retrieve this script from openstack dashboard (web interface) 
# at the "API access" section. There, on the upper right corner, a drop down list 
# allows you to download the OpenStack RC files as well as the clouds.yaml file.

export OS_AUTH_URL=https://genostack-api-keystone.genouest.org/v3
export OS_PROJECT_ID=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
export OS_PROJECT_NAME="XXXXXX"

export OS_USER_DOMAIN_NAME="Users"
if [ -z "$OS_USER_DOMAIN_NAME" ]; then unset OS_USER_DOMAIN_NAME; fi

export OS_PROJECT_DOMAIN_ID="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
if [ -z "$OS_PROJECT_DOMAIN_ID" ]; then unset OS_PROJECT_DOMAIN_ID; fi

# unset v2.0 items in case set
unset OS_TENANT_ID
unset OS_TENANT_NAME
unset OS_PASSWORD

export OS_USERNAME="XXXXXX"
#echo "Please enter your OpenStack Password for project $OS_PROJECT_NAME as user $OS_USERNAME: "
#read -sr OS_PASSWORD_INPUT
#export OS_PASSWORD=$OS_PASSWORD_INPUT

# If your configuration has multiple regions, we set that information here.
# OS_REGION_NAME is optional and only valid in certain environments.
export OS_REGION_NAME="GenOuest"
# Don't leave a blank variable, unset it if it was empty
if [ -z "$OS_REGION_NAME" ]; then unset OS_REGION_NAME; fi

export OS_INTERFACE=public
export OS_IDENTITY_API_VERSION=3