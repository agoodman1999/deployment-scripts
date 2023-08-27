export INFISICAL_TOKEN="{{ INFISICAL_TOKEN_DEVELOPMENT_GITHUB }}"
export INFISICAL_API_URL="https://infisical.civiconnect.net/api"
export infisical secrets set --env dev --path /github HOST_NAME=bitnami HOST_IP=$(curl -s https://ipinfo.io/ip)