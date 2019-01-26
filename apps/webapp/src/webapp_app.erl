-module(webapp_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

-include("webapp.hrl").

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    webapp_sup:start_link().

stop(_State) ->
    ok.
