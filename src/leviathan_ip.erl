-module(leviathan_ip).

-compile(export_all).



%% All parameters must be strings

link_add_type_veth_peer_name(DevNameA,DevNameB)->
    "ip link add " ++  DevNameA ++ " type veth peer name " ++ DevNameB.
    
link_set_up(DevName)->
    "ip link set " ++ DevName ++ " up".

link_set_netns(DevName,CPid)->
    "ip link set " ++ DevName ++ " netns $" ++ CPid.

netns_exec_ip_link_set_dev_name(CPid,OrigDevName,NewDevName)->
    "ip netns exec $" ++ CPid ++ " ip link set dev " ++ OrigDevName ++ " name " ++ NewDevName.

netns_exec_ip_link_set_address(CPid,DevName,Address)->
    "ip netns exec $" ++ CPid ++ " ip link set " ++ DevName ++ " address " ++ Address.


netns_exec_ip_link_set_up(CPid,DevName)->
    "ip netns exec $" ++ CPid ++ " ip link set " ++ DevName ++ " up".


%
% Example "ip netns exec $pid ip addr add 172.17.42.99/16 dev eth0"
%
netns_exec_ip_addr_add_dev(CPid,Address,DevName)->
    "ip netns exec $" ++ CPid ++ " ip addr add " ++ Address ++ " dev " ++ DevName.

%
% Example: "ip netns exec $pid ip route add default via 172.17.42.1"
%
netns_exec_ip_route_add_default_via(CPid,Address)->
    "ip netns exec $"  ++ CPid ++ " ip route add default via " ++ Address.
    
    
