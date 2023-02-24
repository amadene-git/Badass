#!/bin/bash

docker build ./admadene_routeur  -t routeur_img
docker pull alpine

tar -xf P2.tar
gns3 P2.gns3
