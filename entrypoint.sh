#!/bin/sh
set -e
: "${UUID:?UUID env is required}"
WSPATH="${WSPATH:-/ray}"
PORT="${PORT:-8080}"
mkdir -p /usr/local/etc/xray
cat > /usr/local/etc/xray/config.json <<EOF
{"log":{"loglevel":"warning"},"inbounds":[{"listen":"0.0.0.0","port":${PORT},"protocol":"vless","settings":{"clients":[{"id":"${UUID}"}],"decryption":"none"},"streamSettings":{"network":"ws","wsSettings":{"path":"${WSPATH}"}}}],"outbounds":[{"protocol":"freedom"}]}
EOF
exec /usr/local/bin/xray run -config /usr/local/etc/xray/config.json
