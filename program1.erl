-module(program1).
%-export([/1])
-export([get_numData/0, compute/1]).
-team("Annie Pi, Katie Sugg, Christina Yi").

% Tail-recursive function to get input and continue until 0 is entered
get_numData() ->
    io:format("Enter a number: "),
    Input = io:get_line(""),  % Get input as a string
    case string:to_integer(string:trim(Input)) of
        {ok, 0} -> 
            io:format("Stopping the loop. Goodbye!~n");  % Base case: stop on 0
        {ok, Num} -> 
            compute(Num),
            get_numData();  % Tail recursion: call itself again
        error -> 
            io:format("Not an integer. Please try again.~n"),
            get_numData()  % Tail recursion: call itself again on error
    end.

% Perform computation based on the number
compute(Num) when Num < 0 ->
    AbsValue = abs(Num),
    Result = math:pow(AbsValue, 7),
    io:format("Absolute value raised to the 7th power: ~w~n", [Result]);
compute(0) ->
    io:format("Input is 0~n");
compute(Num) when Num > 0 ->
    case Num rem 7 of
        0 -> Root5 = math:pow(Num, 1/5),
             io:format("The 5th root of the number: ~w~n", [Root5]);
        _ -> Factorial = factorial(Num),
             io:format("The factorial of the number: ~w~n", [Factorial])
    end.

% Factorial supporting function
factorial(0) -> 1;
factorial(N) -> N * factorial(N - 1).