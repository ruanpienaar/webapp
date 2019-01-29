-module(webapp_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

-include("webapp.hrl").

%% ===================================================================
%% Application callbacks
%% ===================================================================

% -spec start(StartType :: application:start_type(), StartArgs :: term()) ->
%     {'ok', pid()} | {'error', Reason :: term()}.
start(_StartType, _StartArgs) ->
    webapp_sup:start_link().

-spec stop(term()) -> {ok, pid()}.
stop(_State) ->
    ok.
