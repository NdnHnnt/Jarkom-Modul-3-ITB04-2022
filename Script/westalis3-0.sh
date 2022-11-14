echo "INTERFACES=\"eth0\""> /etc/default/isc-dhcp-server

service isc-dhcp-server restart

echo 'subnet 192.216.2.0 netmask 255.255.255.0 {
}
subnet 192.216.1.0 netmask 255.255.255.0 {
    range  192.216.1.50 192.216.1.88;
    range  192.216.1.120 192.216.1.155;
    option routers 192.216.1.1;
    option broadcast-address 192.216.1.255;
    option domain-name-servers 192.216.2.2;
    default-lease-time 300;
    max-lease-time 6900;
}' > /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart