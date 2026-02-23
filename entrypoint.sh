#!/bin/bash

CONFIG_DCT="/${HANDLE_SERVER_DIR}/${SERVER_NAME}/config.dct"

echo "Configuring \"${CONFIG_DCT}\" :"
echo
echo "\"${CONFIG_DCT}\" content before :"
echo

cat ${CONFIG_DCT}
echo

sed -i "s/BIND_IP/${BIND_IP}/g" ${CONFIG_DCT}
sed -i "s/HTTP_PORT/${HTTP_PORT}/g" ${CONFIG_DCT}
sed -i "s/LOG_ACCESS/${LOG_ACCESS}/g" ${CONFIG_DCT}
sed -i "s/TCP_UDP_PORT/${TCP_UDP_PORT}/g" ${CONFIG_DCT}
sed -i "s/LOG_ROTATION_FREQUENCY_LONG/${LOG_ROTATION_FREQUENCY_LONG}/g" ${CONFIG_DCT}
sed -i "s|PREFIXES_ADMINS|${PREFIXES_ADMINS}|g" ${CONFIG_DCT}
sed -i "s|HANDLE_PREFIXES|${HANDLE_PREFIXES}|g" ${CONFIG_DCT}

echo "\"${CONFIG_DCT}\" content after :"
echo

cat ${CONFIG_DCT}
echo

echo "Configuring \"/${HANDLE_SERVER_DIR}/${SERVER_NAME}/handle-dspace-plugin.cfg\" :"
echo

cat /${HANDLE_SERVER_DIR}/${SERVER_NAME}/handle-dspace-plugin.cfg
echo

printf "%b" "${DSPACE_SERVER_URLS}" > /${HANDLE_SERVER_DIR}/${SERVER_NAME}/handle-dspace-plugin.cfg

echo
cat /${HANDLE_SERVER_DIR}/${SERVER_NAME}/handle-dspace-plugin.cfg
echo
echo

echo "Done configuring \"/${HANDLE_SERVER_DIR}/${SERVER_NAME}/handle-dspace-plugin.cfg\" ."
echo

echo "Starting handle-server: \"/${HANDLE_SERVER_DIR}/handle-${HANDLE_SOFTWARE_VER}/bin/hdl-server /${HANDLE_SERVER_DIR}/${SERVER_NAME}\""
echo

/${HANDLE_SERVER_DIR}/handle-${HANDLE_SOFTWARE_VER}/bin/hdl-server /${HANDLE_SERVER_DIR}/${SERVER_NAME} &

sleep 5

echo 'Handle server started ...'
echo

netstat -tulnp

echo
echo "Logs files are under: \"/${HANDLE_SERVER_DIR}/${SERVER_NAME}/logs\""
echo

tail -f /dev/null

