mkdir -p /etc/bind/loid-work

mkdir -p /etc/bind/franky-work

echo 'zone "loid-work.com" {
        type master;
        file "/etc/bind/loid-work/loid-work.com";
};
zone "franky-work.com" {
        type master;
        file "/etc/bind/franky-work/franky-work.com";
};' > /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/loid-work/loid-work.com

cp /etc/bind/db.local /etc/bind/franky-work/franky-work.com

echo '$TTL    604800
@       IN      SOA     loid-work.com. root.loid-work.com. (
                              20221110          ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      loid-work.com.
@       IN      A       192.216.2.2
@       IN      AAAA    ::1' > /etc/bind/loid-work/loid-work.com

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     franky-work.com. root.franky-work.com. (
                              20221110          ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      franky-work.com.
@       IN      A       192.216.2.2
@       IN      AAAA    ::1' > /etc/bind/franky-work/franky-work.com