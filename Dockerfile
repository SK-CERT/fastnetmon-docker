FROM debian:stretch-slim AS build

ARG VERSION=stable
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL

WORKDIR /

RUN apt-get update && apt-get install -y --no-install-recommends wget ca-certificates perl && \
    wget https://raw.githubusercontent.com/pavel-odintsov/fastnetmon/master/src/fastnetmon_install.pl -Ofastnetmon_install.pl && \
    echo build@example.com | if [ "x$VERSION" = "stable" ] ; then perl fastnetmon_install.pl --do-not-track-me ; else perl fastnetmon_install.pl --do-not-track-me --use-git-master ; fi && \
    rm -f /fastnetmon_install.pl && \
    apt-get purge -y wget ca-certificates perl && apt-get autoremove -y

COPY ./assets/entrypoint.sh /entrypoint.sh

LABEL org.label-schema.name="FastNetMon" \
      org.label-schema.description="DDoS detection tool" \
      org.label-schema.url="https://fastnetmon.com/" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.vcs-url="$VCS_URL" \
      org.label-schema.vcs-ref="$VCS_REF" \
      org.label-schema.schema-version="1.0.0-rc.1"

EXPOSE 2055/udp
EXPOSE 6343/udp
EXPOSE 179/tcp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/opt/fastnetmon/fastnetmon"]
