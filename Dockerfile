FROM ghcr.io/xtls/xray-core:latest AS src
FROM alpine:3.20
COPY --from=src /usr/local/bin/xray /usr/local/bin/xray
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
