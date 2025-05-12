FROM alpine

LABEL maintainer="https://github.com/rbhr" \
      description="Clipsal C-Gate Server 3.4.x" \
      version="3.4.1"

RUN apk update && apk add --no-cache openjdk11-jre-headless

EXPOSE 20023 20024 20025 20026 20123

RUN mkdir /cgate3
WORKDIR /cgate3

ENV CGATE_HOME=/cgate3/home
ENV CGATE_APPDATA=/cgate3/appdata

COPY rootfs/cgate.zip .
RUN set -ex && \
    unzip -o cgate.zip -d . && \
    rm cgate.zip && \
    ln -s /cgate3/appdata/config /config && \
    ln -s /cgate3/appdata/logs /logs && \
    ln -s /cgate3/Projects /Projects


    
COPY rootfs/ .
COPY start.sh .

VOLUME ["/config", "/Projects", "/logs"]

WORKDIR /cgate3
RUN chmod +x start.sh
CMD ["./start.sh"]
