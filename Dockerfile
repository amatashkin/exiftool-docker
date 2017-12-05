FROM alpine:latest
MAINTAINER Alexey Matashkin

ENV EXIFTOOL_VERSION=10.67

RUN apk add --no-cache perl make
RUN cd /tmp \
	&& apk update \
	&& apk add ca-certificates \
	&& update-ca-certificates \
	&& apk add openssl \
	&& wget https://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-${EXIFTOOL_VERSION}.tar.gz \
	&& tar -zxvf Image-ExifTool-${EXIFTOOL_VERSION}.tar.gz \
	&& cd Image-ExifTool-${EXIFTOOL_VERSION} \
	&& perl Makefile.PL \
	&& make test \
	&& make install \
	&& cd .. \
	&& rm -rf Image-ExifTool-${EXIFTOOL_VERSION}


VOLUME /tmp

WORKDIR /tmp

ENTRYPOINT ["exiftool"]
