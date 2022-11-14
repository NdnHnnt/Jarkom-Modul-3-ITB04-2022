echo 'acl HK time MTWHF 08:00-17:00

http_port 8080
http_access deny HK
http_access allow all
visible_hostname Berlint' > /etc/squid/squid.conf