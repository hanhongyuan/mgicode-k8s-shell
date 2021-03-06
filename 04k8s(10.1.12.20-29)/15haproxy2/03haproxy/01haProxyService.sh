
NODE_IPS="10.1.12.80  10.1.12.81"
NODE_NAME="balance01 balance02 "


#/usr/sbin/keepalived -P -C -d -D -S 7 -f /etc/keepalived/keepalived.conf 

mkdir -p /balanceHaProxy/
cd /balanceHaProxy/
cat > /balanceHaProxy/haproxy.service <<EOF
[Unit]
Description=haproxy agent
Requires=network-online.target
After=network-online.target

#
[Service]
Restart=on-failure
ExecStart=/usr/sbin/haproxy  -f /etc/haproxy/haproxy.cfg
ExecReload=/bin/kill -HUP $MAINPID

[Install]
WantedBy=multi-user.target
EOF

echo -e "\033[32m ############### haproxy.service ########### \033[0m"
cat /balanceHaProxy/haproxy.service
echo -e "\033[32m ###########内容显示完成########### \033[0m"

sleep 5