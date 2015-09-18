-module(leviathan_mnesia).

-export([start/0, clear/0]).

-include("leviathan.hrl").

start() ->
    erl_mnesia:tables(tabledefs()).

clear() ->
    lists:foreach(
        fun({Name, _}) ->
            {atomic, ok} = mnesia:clear_table(Name)
        end,
    tabledefs()).

tabledefs() ->
    [
        {leviathan_cen,  [{attributes, record_info(fields, leviathan_cen)},
                          {disc_copies, [node()]},
                          {type, set}]},
        {leviathan_cont, [{attributes, record_info(fields, leviathan_cont)},
                          {disc_copies, [node()]},
                          {type, bag}]}
    ].