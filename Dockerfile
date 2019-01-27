FROM registry.hub.docker.com/library/alpine
RUN apk --update add curl jq python py-pip make git wget erlang erlang-ssl erlang-public-key erlang-asn1 erlang-crypto erlang-debugger erlang-dev erlang-dialyzer erlang-edoc erlang-erl-docgen erlang-erl-interface erlang-erts erlang-et erlang-eunit erlang-hipe erlang-ic erlang-inets erlang-runtime-tools erlang-sasl erlang-syntax-tools erlang-tools erlang-wx && rm -rf /var/cache/apk/*
