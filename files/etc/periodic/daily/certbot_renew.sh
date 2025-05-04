#!/bin/ash -e

cd $DPSRV_HOME/certbot-dns
docker compose build

docker run -it --rm \
	--network dpsrv \
	--env-file $DPSRV_HOME/rc/secrets/local/$DPSRV_REGION-$DPSRV_NODE/$DPSRV_REGION-$DPSRV_NODE.env \
	-v $DPSRV_HOME/rc/secrets/bind:/etc/bind/ \
	-v $DPSRV_HOME/rc/secrets/letsencrypt/:/etc/letsencrypt/ \
	--name dpsrv-certbot-dns-latest \
	dpsrv/certbot-dns:latest renew
