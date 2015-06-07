FROM debian:sid

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y install git wget curl make perl gcc build-essential libssl-dev && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /app && \
    cd app && \
    curl https://wakaba.github.io/packages/pmbp | sh && \
    perl local/bin/pmbp.pl \
        --perl-version latest --perl-relocatable --install-perl \
        --create-perl-command-shortcut @perl \
        --create-perl-command-shortcut @prove \
        --install-module Encode \
        --install-module Crypt::SSLeay \
        --install-module Unicode::Normalize && \
    rm -fr deps
