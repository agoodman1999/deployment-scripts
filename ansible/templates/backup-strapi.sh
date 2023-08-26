#!/bin/bash
export INFISICAL_TOKEN="{{ INFISICAL_TOKEN_PRODUCTION_STRAPI }}"
export INFISICAL_API_URL="https://infisical.civiconnect.net/api"

instance_id=$(curl -s http://169.254.169.254/latest/meta-data/instance-id | cut -d '-' -f 2)
file_name="$1-$instance_id"

cd /home/bitnami/strapi-prod
infisical run --env=prod --path="/strapi" -- npm run strapi export -- --no-encrypt --file /home/bitnami/strapi-prod/"$file_name"-prod
aws s3 cp /home/bitnami/strapi-prod/"$file_name".tar.gz s3://civiconnect-automated-strapi-backups/"$file_name"-prod.tar.gz
rm /home/bitnami/strapi-prod/"$file_name"-prod.tar.gz