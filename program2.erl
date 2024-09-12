-module(program2).
%-export([/1])
-export([start/0]).
-team("Annie Pi, Katie Sugg, Christina Yi").

% Start the loop
start() ->
    io:format("Enter numbers (enter 0 to stop)~n"),
    program1: get_numData().
