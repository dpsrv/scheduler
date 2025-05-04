FROM alpine:3.18

RUN apk add sudo docker docker-compose cgroup-tools openssl git bash bind-tools \
	&& rm -rf /var/cache/apk/*

RUN chmod g+rx /root && \
	addgroup -S -g 1000 dpsrv && \
        adduser -S -G root -u 1000 dpsrv dpsrv

COPY files/ /

RUN sed -i '/^# min.*/a *       *       *       *       *       run-parts /etc/periodic/1min' /etc/crontabs/root
