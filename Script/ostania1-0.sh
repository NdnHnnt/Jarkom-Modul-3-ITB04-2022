iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.216.0.0/16

cat /etc/resolv.conf

ping -c 3 google.com

apt-get install isc-dhcp-relay -y