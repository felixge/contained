# Installed required packages
apt-get install lxc debootstrap bridge-utils

# Add a new bridge for LXC, including NAT rule
(
cat << EOF

# LXC bridge
auto br-lxc
iface br-lxc inet static
    address 192.168.254.1
    netmask 255.255.255.0

    post-up echo 1 > /proc/sys/net/ipv4/ip_forward
    post-up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
    pre-down echo 0 > /proc/sys/net/ipv4/ip_forward
    pre-down iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

    bridge_ports none
    bridge_stp off
EOF
) >> /etc/network/interfaces
ifup br-lxc

# Create a mountpoint and mount cgroup
mkdir /cgroup
(
cat << EOF
cgroup /cgroup cgroup
EOF
) >> /etc/fstab
mount /cgroup

# Basic configuration for networking
(
cat << EOF
lxc.network.type = veth
lxc.network.flags = up
lxc.network.link = br-lxc
EOF
) > network.conf

###
### This is the part you will want to call for each container you create
###

# Create our first template and container
lxc-create -n natty01 -t natty -f network.conf

# Configure networking for the container
(
cat << EOF
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.168.254.2
    netmask 255.255.255.0
    gateway 192.168.254.1
EOF
) > /var/lib/lxc/natty01/rootfs/etc/network/interfaces

# Sometimes resolv.conf is a symlink, make sure it doesn't exist
rm -f /var/lib/lxc/natty01/rootfs/etc/resolv.conf
echo "nameserver 8.8.8.8" > /var/lib/lxc/natty01/rootfs/etc/resolv.conf

# Start it and wait for it to start
lxc-start -n natty01 -d
sleep 10

# SSH to it
ssh root@192.168.254.2
