FROM alpine:3.18

RUN apk add docker cgroup-tools openssl \
	&& rm -rf /var/cache/apk/*
