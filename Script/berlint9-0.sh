echo 'acl HK time MTWHF 08:00-17:00
acl WORK time MTWHF 00:00-07:59
acl WORK2 time MTWHF 17:01-24:00
acl HL time AS 00:00-24:00
acl LOID dstdomain loid-work.com
acl FRANKY dstdomain franky-work.com

http_port 8080
http_access allow HK LOID
http_access allow HK FRANKY
http_access deny HK
http_access allow WORK !LOID
http_access allow WORK !FRANKY
http_access allow WORK2 !LOID
http_access allow WORK2 !FRANKY
http_access allow HL !LOID
http_access allow HL !FRANKY
http_access deny all' > /etc/squid/squid.conf
