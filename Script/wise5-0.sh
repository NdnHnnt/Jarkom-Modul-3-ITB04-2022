echo 'options {
        directory "/var/cache/bind";
        forwarders {
                8.8.8.8;
                8.8.8.4;
        };
        allow-query{any;};
        auth-nxdomain no;
        listen-on-v6 { any; };
};' > /etc/bind/named.conf.options

service bind9 restart