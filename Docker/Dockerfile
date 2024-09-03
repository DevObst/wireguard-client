FROM alpine:3.15

RUN apk add --no-cache wireguard-tools iproute2 openresolv

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

CMD ["/usr/local/bin/entrypoint.sh"]