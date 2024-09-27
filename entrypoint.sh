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
sed -i "s/YOUR_PREFIX/${HANDLE_PREFIX}/g" /hs/svr_1/config.dct

echo '"/hs/svr_1/config.dct" content after :'
echo

cat /hs/svr_1/config.dct
echo

echo 'Configuring "/hs/svr_1/handle-dspace-plugin.cfg" :'
echo

cat /hs/svr_1/handle-dspace-plugin.cfg
echo

sed -i "s|DSPACE_SERVER_URL|${DSPACE_SERVER_URL}|g" /hs/svr_1/handle-dspace-plugin.cfg

echo
cat /hs/svr_1/handle-dspace-plugin.cfg

echo
echo 'Done configuring "/hs/svr_1/handle-dspace-plugin.cfg" .'
echo

echo 'Starting handle-server: "/hs/handle-9.3.1/bin/hdl-server /hs/svr_1"'
echo

/hs/handle-9.3.1/bin/hdl-server /hs/svr_1 &

echo 'Handle server started ...'
echo

netstat -tulnp

echo
echo 'Logs files are under: "/hs/svr_1/logs"'
echo

tail -f /dev/null