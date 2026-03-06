#!/bin/sh
# Generate .htpasswd from environment variables before nginx starts

AUTH_USER="${BASIC_AUTH_USER:-admin}"
AUTH_PASS="${BASIC_AUTH_PASSWORD:-changeme}"

echo "[auth] Creating credentials for user: $AUTH_USER"
htpasswd -bc /etc/nginx/.htpasswd "$AUTH_USER" "$AUTH_PASS"
echo "[auth] Done."
