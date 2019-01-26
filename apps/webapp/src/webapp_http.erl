-module(webapp_http).

-export([
    start_link/0
]).

start_link() ->
    cowboy_startup().

cowboy_startup() ->
    Routes = [
        {'_', routes()}
    ],
    Dispatch = cowboy_router:compile(Routes),
    Port = application:get_env(?MODULE, http_port, 54321),
    {ok, _} = cowboy:start_clear(
        ?MODULE, 
        [{port, Port}],
        #{
            env => #{
                dispatch => Dispatch
            }
        }
    ).

routes() ->
    [
        {"/", 
            cowboy_static, {priv_file, webapp, "www/index.html"}},
        {"/[...]", 
            cowboy_static, {priv_dir, webapp, "/www"}}
    ].