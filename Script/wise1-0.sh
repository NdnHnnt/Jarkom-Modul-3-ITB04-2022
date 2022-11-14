echo 'nameserver 192.168.122.1' > /etc/resolv.conf

ping -c 3 google.com

apt-get update

apt-get install bind9 -y