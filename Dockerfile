FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get install -y beanstalkd curl

RUN cd /tmp && \
        curl -LS https://github.com/tyba/beanstool/releases/download/v0.2.0/beanstool_v0.2.0_linux_amd64.tar.gz | tar -zxv  && \
        cp beanstool_v0.2.0_linux_amd64/beanstool /usr/local/bin/

VOLUME ["/wal"]

EXPOSE 11300

CMD ["/usr/bin/beanstalkd", "-b", "/wal", "-f", "0"]
