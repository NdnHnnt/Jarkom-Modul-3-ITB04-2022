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
}
subnet 192.216.3.0 netmask 255.255.255.0 {
    range  192.216.3.10 192.216.3.30;
    range  192.216.3.60 192.216.3.85;
    option routers 192.216.3.1;
    option broadcast-address 192.216.3.255;
    option domain-name-servers 192.216.2.2;
    default-lease-time 600;
    max-lease-time 6900;
}' > /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart