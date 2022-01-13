FROM alpine:3.13

RUN apk add bash curl sudo --no-cache && \
    curl -1sLf \
         'https://dl.cloudsmith.io/public/isc/kea-2-1/setup.alpine.sh' \
         | sudo -E bash && \
    apk add isc-kea-dhcp4 --no-cache && \
    rm -vrf /var/cache/apk/*

ENTRYPOINT ["/usr/sbin/kea-dhcp4"]
CMD ["-c", "/usr/local/etc/kea/kea-dhcp4.conf"]
