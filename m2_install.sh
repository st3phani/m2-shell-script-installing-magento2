#!/usr/bin/env bash

# Magento install variables
dbhost="localhost"
dbname="M_Test"
dbuser="root"
dbpass="root"
base_url="http://mtest.local/"
admin_firstname="Stefan"
admin_lastname="Iurasog"
admin_email="office@green-art.ro"
admin_username="admin"
admin_pass="admin123+"
language="en_US"
backend_frontname="admin"
mage_mode="developer"

while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "options:"
            echo "-h, --help                                Show brief help"
            echo "-r, --run-instalation=DIR                 Run Instalation"
            echo "-rs, --run-instalation-sampledata=DIR     Run instalation with sampledata"
            exit 0
            ;;
        -rs|--run-instalation-sampledata)
            shift
                echo Start composer instalation project;
                composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition magento;
                echo Start SampleData deploy;
                php -d memory_limit=-1 magento/bin/magento sampledata:deploy;
                echo Start Magento install;
                php -d memory_limit=-1 magento/bin/magento setup:install --base-url=$base_url --db-host=$dbhost --db-name=$dbname --db-user=$dbuser --db-password=$dbpass --admin-firstname=$admin_firstname --admin-lastname=$admin_lastname --admin-email=$admin_email --admin-user=$admin_username --admin-password=$admin_pass --language=$language --backend-frontname=$backend_frontname --use-sample-data --magento-init-params="MAGE_MODE=$mage_mode";
                echo Start compilation;
                php -d memory_limit=-1 magento/bin/magento setup:static-content:deploy;
            shift
            ;;
        -r|--run-instalation)
            shift
                echo Start composer instalation project;
                composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition magento;
                echo Start Magento install;
                php -d memory_limit=-1 magento/bin/magento setup:install --base-url=$base_url --db-host=$dbhost --db-name=$dbname --db-user=$dbuser --db-password=$dbpass --admin-firstname=$admin_firstname --admin-lastname=$admin_lastname --admin-email=$admin_email --admin-user=$admin_username --admin-password=$admin_pass --language=$language --backend-frontname=$backend_frontname --magento-init-params="MAGE_MODE=$mage_mode";
                echo Start compilation;
                php -d memory_limit=-1 magento/bin/magento setup:static-content:deploy;
            shift
            ;;

        *)
            echo "The initialization process was not performed!"
            break
            ;;
    esac
done