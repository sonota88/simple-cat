-module(cat).
-export([main/0]).

main_iter(IoDevice) ->
    case file:read(IoDevice, 1) of
        eof -> nil;
        {error, Reason} -> io:fwrite("~s~n", [Reason]);
        {ok, [Byte]} ->
            io:fwrite("~c", [Byte]),
            main_iter(IoDevice)
    end.

main() ->
    io:setopts(standard_io, [{encoding, latin1}]),
    main_iter(standard_io).
