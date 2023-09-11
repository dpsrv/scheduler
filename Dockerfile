FROM alpine:3.18

RUN apk add docker cgroup-tools \
	&& rm -rf /var/cache/apk/*
