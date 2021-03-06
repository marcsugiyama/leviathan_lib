-module(leviathan_docker).

-compile(export_all).

-include("leviathan_logger.hrl").

%
% example: docker inspect -f '{{.State.Pid}}' 63f36fc01b5f
%
inspect_pid
(Cid)->
    Cmd = "docker inspect -f '{{.State.Pid}}' " ++ Cid,
    Result = leviathan_os:cmd(Cmd),
    %%Result = "justtesting",
    Stripped = string:strip(Result,right,$\n),
    ?DEBUG("leviathan:inspect_pid(~p) Stripped = ~p!",[Cid,Stripped]),
    case string:to_integer(Stripped) of
	{Pid,[]}->
	    ?DEBUG("leviathan:inspect_pid(~p) Pid = ~p!",[Cid,Pid]),
	    Stripped;
	_ -> 
	    ?DEBUG("leviathan:inspect_pid(~p) BAD Container PID (must be an integer) ~p!",[Cid,Cid]),
	    %%exit(1) % for running systems
	    "cid:"++Cid % for testing
    end.
    

run(CType,Options,Cmd)->
    "docker run -d " ++ Options ++ " -t " ++ CType ++ " " ++ Cmd.


ps()->
    "docker ps".

inspect(ContainerID)->
    "docker inspect " ++ ContainerID.
