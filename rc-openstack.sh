#!/usr/bin/env bash

DOMAIN_NAME=DSN
TENANT_NAME=JSM-AH1-L

OS_API_VERSION=2
OS_API_HOST=ost-ah1.service.dsn.inet

export OS_INSECURE=true

if [ -z "$OS_USER_DOMAIN_NAME" ]; then unset OS_USER_DOMAIN_NAME; fi

case ${OS_API_VERSION} in
    2)
        export OS_AUTH_URL=https://${OS_API_HOST}:13000/v2.0
        export OS_PROJECT_NAME="${TENANT_NAME}"
        export OS_TENANT_NAME="${TENANT_NAME}"
        export OS_IDENTITY_API_VERSION=2
        ;;
    3)
        export OS_AUTH_URL=https://${OS_API_HOST}:13000/v3
        export OS_PROJECT_NAME="${TENANT_NAME}"
        unset OS_TENANT_ID
        unset OS_TENANT_NAME
        export OS_IDENTITY_API_VERSION=3
        export OS_USER_DOMAIN_NAME="${DOMAIN_NAME}"
        ;;
esac

echo "Please enter your OpenStack User for project $OS_PROJECT_NAME: "
read -sr OS_USER_INPUT
export OS_USERNAME=$OS_USER_INPUT

echo "Please enter your OpenStack Password for project $OS_PROJECT_NAME as user $OS_USERNAME: "
read -sr OS_PASSWORD_INPUT
export OS_PASSWORD=$OS_PASSWORD_INPUT

export OS_REGION_NAME="regionOne"
if [ -z "$OS_REGION_NAME" ]; then unset OS_REGION_NAME; fi

export OS_INTERFACE=public
