FROM registry.hub.docker.com/library/alpine

#TODO find a smarter way of inclunding * into /root/X/
ADD apps /root/webapp/apps
ADD config /root/webapp/config
ADD Dockerfile /root/webapp/Dockerfile
ADD LICENSE /root/webapp/LICENSE
ADD Makefile /root/webapp/Makefile
ADD README.md /root/webapp/README.md
ADD rebar3 /root/webapp/rebar3
ADD rebar.config /root/webapp/rebar.config

# RUN apk --update add curl jq python py-pip make git wget erlang erlang-ssl erlang-public-key erlang-asn1 erlang-crypto erlang-debugger erlang-dev erlang-dialyzer erlang-edoc erlang-erl-docgen erlang-erl-interface erlang-erts erlang-et erlang-eunit erlang-hipe erlang-ic erlang-inets erlang-runtime-tools erlang-sasl erlang-syntax-tools erlang-tools erlang-wx && rm -rf /var/cache/apk/*
RUN apk --update add curl make git wget gcc m4 

RUN wget https://raw.githubusercontent.com/kerl/kerl/master/kerl -O /usr/bin/kerl &&\
    chmod +x /usr/bin/kerl &&\
    kerl update releases

RUN apk add g++ openssl-dev perl ncurses ncurses-dev
    
RUN kerl build 21.2 21.2

RUN cd /root/webapp &&\
    make &&\
    ./rebar3 eunit -v