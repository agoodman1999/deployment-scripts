export INFISICAL_TOKEN="{{ INFISICAL_TOKEN_STRAPI}}"
export INFISICAL_API_URL="https://infisical.civiconnect.net/api"
infisical run --env=prod --path="/strapi" -- npm run build
infisical run --env=prod --path="/strapi" -- npm run start