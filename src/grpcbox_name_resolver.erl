-module(grpcbox_name_resolver).

-export([resolve/1]).

-include_lib("kernel/include/logger.hrl").

%% dns:///localhost
%% ipv4:///127.0.0.1

resolve(Name) ->
    ?LOG_INFO(#{what => debug_grpcbox_name_resolver_0}),
    case uri_string:parse(Name) of
        #{scheme := _Scheme,
          host := _Authority,
          port := Port,
          path := Endpoint} ->
          ?LOG_INFO(#{what => debug_grpcbox_name_resolver_1}),
          {Endpoint, Port};
        _ ->
          ?LOG_INFO(#{what => debug_grpcbox_name_resolver_2}),
          {"127.0.0.1", 8080}
    end.
