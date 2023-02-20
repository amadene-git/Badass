#!/bin/bash

docker pull alpine
docker build . -t routeur_img
gns3 P1-1.gns3