#!/bin/bash

cat router_img.tar.gz | docker import --change 'CMD ["/sbin/tini", "--", "/usr/lib/frr/docker-start"]' - routeur_img
cat host_img.tar | docker import - host_img

gns3 P1.gns3
