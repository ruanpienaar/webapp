-module(webapp_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-include("webapp.hrl").

%% ===================================================================
%% API functions
%% ===================================================================

-spec start_link() -> {ok, pid()}.

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

-spec init(list()) -> {ok, {supervisor:sup_flags(), list(supervisor:child_spec())}}.

init([]) ->
    {ok, 
        {
            #{
                strategy  => one_for_one, % optional
                intensity => 1,           % optional
                period    => 10           % optional
            },
            [
                #{
                    id       => webserver_child,               % mandatory
                    start    => {webapp_http, start_link, []}, % mandatory
                    restart  => permanent,                     % optional
                    shutdown => brutal_kill,                   % optional
                    type     => worker,                        % optional
                    modules  => [webapp_http]                  % optional
                }   
            ]
        }
    }.