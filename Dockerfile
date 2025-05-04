FROM alpine:3.18

RUN apk add docker docker-compose cgroup-tools openssl git bash bind-tools \
	&& rm -rf /var/cache/apk/*

RUN adduser -S -u 1000 docker docker

RUN sed -i '/^# min.*/a *       *       *       *       *       run-parts /etc/periodic/1min' /etc/crontabs/root
