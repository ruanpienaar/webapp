FROM registry.hub.docker.com/ruanpienaar/alpine-linux-erlang:21_2
RUN apk add git
#TODO find a smarter way of inclunding * into /root/X/
ADD apps /root/webapp/apps
ADD config /root/webapp/config
ADD Dockerfile /root/webapp/Dockerfile
ADD LICENSE /root/webapp/LICENSE
ADD Makefile /root/webapp/Makefile
ADD README.md /root/webapp/README.md
ADD rebar3 /root/webapp/rebar3
ADD rebar.config /root/webapp/rebar.config
ADD run_ct.sh /root/webapp/run_ct.sh
ADD run_dialyzer.sh /root/webapp/run_dialyzer.sh
ADD run_xref.sh /root/webapp/run_xref.sh
RUN cd /root/webapp && make
RUN ls -lR /root/webapp
EXPOSE 54321