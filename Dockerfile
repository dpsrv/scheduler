FROM alpine:3.18

ARG DPSRV_UID

RUN apk add sudo docker docker-compose cgroup-tools openssl git bash bind-tools gnupg \
	&& rm -rf /var/cache/apk/*

RUN chmod g+rx /root && \
	addgroup -S -g ${DPSRV_UID} dpsrv && \
        adduser -S -G root -u ${DPSRV_UID} dpsrv dpsrv

COPY files/ /

RUN sed -i '/^# min.*/a *       *       *       *       *       run-parts /etc/periodic/1min' /etc/crontabs/root
