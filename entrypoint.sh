#!/bin/bash

echo 'Configuring "/hs/svr_1/config.dct" :'
echo
echo '"/hs/svr_1/config.dct" content before :'
echo

cat /hs/svr_1/config.dct
echo

sed -i "s/BIND_IP/${BIND_IP}/g" /hs/svr_1/config.dct
sed -i "s/HTTP_PORT/${HTTP_PORT}/g" /hs/svr_1/config.dct
sed -i "s/LOG_ACCESS/${LOG_ACCESS}/g" /hs/svr_1/config.dct
sed -i "s/TCP_UDP_PORT/${TCP_UDP_PORT}/g" /hs/svr_1/config.dct
sed -i "s/LOG_ROTATION_FREQUENCY_LONG/${LOG_ROTATION_FREQUENCY_LONG}/g" /hs/svr_1/config.dct
sed -i "s|PREFIXES_ADMINS|${PREFIXES_ADMINS}|g" /hs/svr_1/config.dct
sed -i "s|HANDLE_PREFIXES|${HANDLE_PREFIXES}|g" /hs/svr_1/config.dct

echo '"/hs/svr_1/config.dct" content after :'
echo

cat /hs/svr_1/config.dct
echo

echo 'Configuring "/hs/svr_1/handle-dspace-plugin.cfg" :'
echo

cat /hs/svr_1/handle-dspace-plugin.cfg
echo

printf "%b" "$DSPACE_SERVER_URLS" > /hs/svr_1/handle-dspace-plugin.cfg

echo
cat /hs/svr_1/handle-dspace-plugin.cfg
echo
echo

echo 'Done configuring "/hs/svr_1/handle-dspace-plugin.cfg" .'
echo

echo 'Starting handle-server: "/hs/handle-9.3.3/bin/hdl-server /hs/svr_1"'
echo

/hs/handle-9.3.3/bin/hdl-server /hs/svr_1 &

sleep 5

echo 'Handle server started ...'
echo

netstat -tulnp

echo
echo 'Logs files are under: "/hs/svr_1/logs"'
echo

tail -f /dev/null
