#!/bin/sh
cd `dirname $0`
./rebar3 compile && ./rebar3 dialyzer