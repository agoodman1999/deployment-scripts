#!/bin/bash
export INFISICAL_TOKEN="{{ INFISICAL_TOKEN_DEVELOPMENT_STRAPI }}"
export INFISICAL_API_URL="https://infisical.civiconnect.net/api"

instance_id=$(curl -s http://169.254.169.254/latest/meta-data/instance-id | cut -d '-' -f 2)
file_name="$1-$instance_id"

cd /home/bitnami/strapi-dev
infisical run --env=dev --path="/strapi" -- npm run strapi export -- --no-encrypt --file ../"$file_name"-dev
aws s3 cp ../"$file_name".tar.gz s3://civiconnect-automated-strapi-backups/"$file_name"-dev.tar.gz
rm ../"$file_name"-dev.tar.gz