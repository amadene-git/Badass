if [ $# -ne 2 ]
then
    echo "Usage: ./script.sh local dest"
else
    /sbin/ip link add br0 type bridge
    /sbin/ip link set br0 up

    /sbin/ip addr add "10.1.1.$1/24" dev eth0
    /sbin/ip link add name vxlan10 type vxlan id 10 group 239.1.1.1 dstport 4789
    /sbin/ip addr add "20.1.1.$1/24" dev vxlan10
    /sbin/ip link set dev vxlan10 up

    brctl addif br0 eth1
    brctl addif br0 vxlan10
fi

