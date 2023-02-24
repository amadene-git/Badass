#!/bin/bash

docker pull alpine
docker build ./admadene_routeur -t routeur_img

tar -xvf P1.tar
gns3 P1.gns3
