export INFISICAL_TOKEN="{{ INFISICAL_TOKEN_NEXTJS }}"
export INFISICAL_API_URL="https://infisical.civiconnect.net/api"
infisical run --env=prod --path="/nextjs" -- npm run build
infisical run --env=prod --path="/nextjs" -- npm run start