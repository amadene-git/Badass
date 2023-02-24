#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Usage: ./setup.sh id"
	exit
fi


cat << EOF | vtysh
conf t

int lo
ip addr 1.1.1.$1/32

int eth0
ip addr 10.1.1.$1/30

router ospf
network 0.0.0.0/0 are 0

router isis 1
net 49.0000.0000.000$1.00

int lo
ip router isis 1

int eth0
ip router isis 1

EOF
