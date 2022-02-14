FROM alpine:3.13

ARG KEA_DHCP_VERSION=2-1

RUN apk add bash curl sudo --no-cache && \
    curl -1sLf \
         https://dl.cloudsmith.io/public/isc/kea-${KEA_DHCP_VERSION}/setup.alpine.sh \
         | sudo -E bash && \
    apk add isc-kea-dhcp4 isc-kea-admin mariadb-client --no-cache && \
    rm -vrf /var/cache/apk/*

ENTRYPOINT ["/usr/sbin/kea-dhcp4"]
CMD ["-c", "/usr/local/etc/kea/kea-dhcp4.conf"]
