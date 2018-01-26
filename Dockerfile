FROM alpine:3.7

ENV LOCAL_IP       0.0.0.0
ENV LOCAL_PORT     5353
ENV RESOLVER_IP    84.16.240.43
ENV RESOLVER_PORT  443
ENV PROVIDER_NAME  2.dnscrypt-cert.cryptostorm.is
ENV PROVIDER_KEY   3133:72AD:5956:32C2:416B:872F:098F:851B:DDB9:6528:4C6C:BE9A:4F19:0964:30DB:A95A

RUN set -xe && \
    apk add --no-cache dnscrypt-proxy

USER dnscrypt

EXPOSE $LOCAL_PORT/tcp $LOCAL_PORT/udp

CMD dnscrypt-proxy --local-address=$LOCAL_IP:$LOCAL_PORT \
                   --provider-name=$PROVIDER_NAME \
                   --provider-key=$PROVIDER_KEY \
                   --resolver-address=$RESOLVER_IP:$RESOLVER_PORT
