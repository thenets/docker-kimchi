FROM ubuntu:16.04

RUN set -x \
    && apt-get update \
    && apt-get install -y nginx wget \
    && mkdir -p kimchi-packages \
    && cd kimchi-packages \
    && wget https://github.com/kimchi-project/wok/releases/download/2.5.0/wok-2.5.0-0.noarch.deb \
    && wget http://kimchi-project.github.io/gingerbase/downloads/latest/ginger-base.noarch.deb \
    && wget https://github.com/kimchi-project/kimchi/releases/download/2.5.0/kimchi-2.5.0-0.noarch.deb

COPY src/keyboard /etc/default/keyboard

RUN set -x \
    && dpkg -i kimchi-packages/*.noarch.deb || true \
    && rm -Rf ./kimchi-packages/ \
    && apt-get install -fy
