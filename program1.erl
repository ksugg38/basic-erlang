-module(program1).
%-export([/1])
-export([get_numData/0, compute/1]).
-team("Annie Pi, Katie Sugg, Christina Yi").

% Get a number from the user
get_numData() ->
    {ok, Num} = io:read("Enter a number: "),
    io:format("The number you entered is: ~w~n", [Num]),
    case erlang:is_integer(Num) of
        true -> compute(Num);
        false -> io:format("Not an integer~n")
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