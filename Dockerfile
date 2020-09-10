FROM ubuntu:18.04

ENV SO="Ubuntu18"
ENV VERSION="v66"
RUN apt-get update && apt-get install -y wget unzip
RUN wget http://sourceforge.net/projects/nmon/files/njmon_linux_binaries_$VERSION.zip
RUN unzip njmon_$PLATFORM_binaries_$VERSION.zip -d /njmon

FROM ubuntu:18.04
COPY --from=0 /njmon/njmon_$SO_x86_64_$VERSION /usr/bin/njmon
RUN chmod +x /usr/bin/njmon

ADD entrypoint.sh /
WORKDIR /njmon-data

ENTRYPOINT ["/entrypoint.sh"]
