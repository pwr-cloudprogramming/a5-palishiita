#!/bin/bash
echo "This script should start your application"
API_URL="http://169.254.169.254/latest/api"
TOKEN=`curl -X PUT "$API_URL/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 600"`
TOKEN_HEADER="X-aws-ec2-metadata-token: $TOKEN"
METADATA_URL="http://169.254.169.254/latest/meta-data"
IP_V4=`curl -H "$TOKEN_HEADER" -s $METADATA_URL/public-ipv4`

echo "$IP_V4"

sed -i "s/192.168.100.18/$IP_V4/g" /a5-palishiita/build/.env

docker-compose -f /a5-palishiita/build/compose.yaml up -d