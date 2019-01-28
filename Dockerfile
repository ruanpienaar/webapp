FROM registry.hub.docker.com/ruanpienaar/alpine-linux-erlang:21_2
#TODO find a smarter way of inclunding * into /root/X/
ADD apps /root/webapp/apps
ADD config /root/webapp/config
ADD Dockerfile /root/webapp/Dockerfile
ADD LICENSE /root/webapp/LICENSE
ADD Makefile /root/webapp/Makefile
ADD README.md /root/webapp/README.md
ADD rebar3 /root/webapp/rebar3
ADD rebar.config /root/webapp/rebar.config
RUN cd /root/webapp &&\
    make