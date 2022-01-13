# docker-kea-dhcp
Docker images for Kea DHCP server

## Run Kea-dhcp4 server

```
docker run -d --name kea-dhcp \
  -v ${PWD}/kea-dhcp4.conf:/usr/local/etc/kea/kea-dhcp4.conf \
  saravanan30/kea-dhcp-server:latest
```

## Run Kea-dhcp-ddns server

```
docker run -d --name kea-dhcp-ddns \
  --entrypoint=/usr/sbin/kea-dhcp-ddns \
  -v ${PWD}/kea-dhcp-ddns.conf:/usr/local/etc/kea/kea-dhcp-ddns.conf \
  saravanan30/kea-dhcp-server:latest -c /usr/local/etc/kea/kea-dhcp-ddns.conf
```
