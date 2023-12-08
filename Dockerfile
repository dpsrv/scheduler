FROM alpine:3.18

RUN apk add docker cgroup-tools openssl git bash \
	&& rm -rf /var/cache/apk/*

RUN sed -i '/^# min.*/a *       *       *       *       *       run-parts /etc/periodic/1min' /etc/crontabs/root
