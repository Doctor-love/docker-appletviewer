FROM debian:stretch-slim

RUN mkdir -p /usr/share/man/man1mkdir -p /usr/share/man/man1
RUN apt-get -y update \
    && apt-get install -y --no-install-recommends openjdk-8-jdk \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoremove -y

RUN useradd -m -s /bin/bash app
USER app

ENTRYPOINT ["appletviewer"]
