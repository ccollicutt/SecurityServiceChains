PROJECT_ID=$TF_VAR_packet_project_id
API_KEY=$TF_VAR_packet_auth_token
SERVER_TYPE=1

for j in `ls -1 Spawns`
do
  echo $j
  DEVICE_ID=`jq -r '.id' Spawns/$j`
  echo $DEVICE_ID

  IP_ADDR=`curl --silent                                   \
        -X GET                                 \
        -H "X-Auth-Token: $API_KEY"             \
        -H "Content-Type: application/json"     \
        "https://api.packet.net/devices/$DEVICE_ID" | jq -r '.ip_addresses[0].address'`

  echo $IP_ADDR
  ssh root@$IP_ADDR uptime


echo

done

