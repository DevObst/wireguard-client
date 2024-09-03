#!/bin/sh

# Checking if all required environment variables are set
if [ -z "$WIREGUARD_PRIVATE_KEY" ]; then
    echo "Environment value WIREGUARD_PRIVATE_KEY is missing"
    exit 1
fi

if [ -z "$WIREGUARD_ADDRESS" ]; then
    echo "Environment value WIREGUARD_ADDRESS is missing"
    exit 1
fi

if [ -z "$WIREGUARD_MTU" ]; then
    echo "Environment value WIREGUARD_MTU is missing"
    exit 1
fi

if [ -z "$WIREGUARD_PUBLIC_KEY" ]; then
    echo "Environment value WIREGUARD_PUBLIC_KEY is missing"
    exit 1
fi

if [ -z "$WIREGUARD_ENDPOINT" ]; then
    echo "Environment value WIREGUARD_ENDPOINT is missing"
    exit 1
fi

if [ -z "$WIREGUARD_ALLOWED_IPS" ]; then
    echo "Environment value WIREGUARD_ALLOWED_IPS is missing"
    exit 1
fi

if [ -z "$WIREGUARD_PERSISTENT_KEEPALIVE" ]; then
    echo "Environment value WIREGUARD_PERSISTENT_KEEPALIVE is missing"
    exit 1
fi

if [ -z "$WIREGUARD_PRESHARED_KEY" ]; then
    echo "Environment value WIREGUARD_PRESHARED_KEY is missing"
    exit 1
fi

# Generating wg0.conf configuration file
cat <<EOF > /etc/wireguard/wg0.conf
[Interface]
PrivateKey = ${WIREGUARD_PRIVATE_KEY}
Address = ${WIREGUARD_ADDRESS}
MTU = ${WIREGUARD_MTU}

[Peer]
PublicKey = ${WIREGUARD_PUBLIC_KEY}
Endpoint = ${WIREGUARD_ENDPOINT}
AllowedIPs = ${WIREGUARD_ALLOWED_IPS}
PersistentKeepalive = ${WIREGUARD_PERSISTENT_KEEPALIVE}
PresharedKey = ${WIREGUARD_PRESHARED_KEY}
EOF

# Starting WireGuard
wg-quick up /etc/wireguard/wg0.conf

# Checking VPN connection status
sleep 10
if ! wg show wg0; then
    echo "Failed to establish VPN connection"
    exit 1
fi

# Preventing container from exiting
tail -f /dev/null