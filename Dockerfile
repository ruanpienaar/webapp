FROM registry.hub.docker.com/library/ruanpienaar/alpine-linux-erlang

#TODO find a smarter way of inclunding * into /root/X/
ADD apps /root/webapp/apps
ADD config /root/webapp/config
ADD Dockerfile /root/webapp/Dockerfile
ADD LICENSE /root/webapp/LICENSE
ADD Makefile /root/webapp/Makefile
ADD README.md /root/webapp/README.md
ADD rebar3 /root/webapp/rebar3
ADD rebar.config /root/webapp/rebar.config

RUN . /root/erlang/21.2/activate &&\
    cd /root/webapp &&\
    make