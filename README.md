# docker-wireguard-client

This application allows a container/pod to connect to a VPN using the WireGuard protocol. Before starting the container, you need to properly set the environment variables:

## Environment variables to set:
<b>`WIREGUARD_PRIVATE_KEY`</b> - Private key obtained from the VPN server <br>
<b>`WIREGUARD_ADDRESS`</b> - IP address assigned to this profile <br>
<b>`WIREGUARD_MTU`</b> - Maximum Transport Unit - maximum 1420 <br>
<b>`WIREGUARD_PUBLIC_KEY`</b> - Public key obtained from the VPN server <br>
<b>`WIREGUARD_ENDPOINT`</b> - External IP address of the VPN server <br>
<b>`WIREGUARD_ALLOWED_IPS`</b> - IP addresses the container/pod should have access to <br>
<b>`WIREGUARD_PERSISTENT_KEEPALIVE`</b> - How often WireGuard should send empty packets to keep the VPN connection alive (in seconds, preferably 25s or more) <br>
<b>`WIREGUARD_PRESHARED_KEY`</b> - PSK key obtained from the VPN server<br>
