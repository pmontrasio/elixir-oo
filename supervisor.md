```
iex(1)> import Supervisor.Spec
nil

# First style, use an atom as the name

iex(2)> children = [worker(Counter,[0, [name: :sup_counter]])]
[{Counter, {Counter, :start_link, [0, [name: :sup_counter]]}, :permanent, 5000,
  :worker, [Counter]}]
iex(3)> {:ok, pid} = Supervisor.start_link(children, strategy: :one_for_one)
{:ok, #PID<0.90.0>}
iex(4)> GenServer.call(:sup_counter, :value)   # but Counter.value(:sup_counter) works too
0
iex(5)> GenServer.cast(:sup_counter, :inc)  
:ok
iex(6)> GenServer.cast(:sup_counter, :inc)
:ok
iex(7)> GenServer.call(:sup_counter, :value)
2
iex(8)> GenServer.cast(:sup_counter, :dec)  
:ok
iex(9)> 
19:26:21.498 [error] GenServer :sup_counter terminating
** (FunctionClauseError) no function clause matching in Counter.handle_cast/2
    (counter) lib/counter.ex:25: Counter.handle_cast(:dec, 2)
    (stdlib) gen_server.erl:615: :gen_server.try_dispatch/4
    (stdlib) gen_server.erl:681: :gen_server.handle_msg/5
    (stdlib) proc_lib.erl:240: :proc_lib.init_p_do_apply/3
Last message: {:"$gen_cast", :dec}
State: 2

nil
iex(10)> GenServer.call(:sup_counter, :value)
0

# Second style

iex(11)> children2 = [worker(Counter,[0, [name: SupCounter]])]  
[{Counter, {Counter, :start_link, [0, [name: SupCounter]]}, :permanent, 5000,
  :worker, [Counter]}]
iex(12)> {:ok, pid2} = Supervisor.start_link(children2, strategy: :one_for_one)
{:ok, #PID<0.102.0>}
iex(13)> Counter.value(SupCounter)
0
iex(14)> Counter.inc(SupCounter)  
:ok
iex(15)> Counter.inc(SupCounter)
:ok
iex(16)> Counter.inc(SupCounter)
:ok
iex(17)> Counter.value(SupCounter)                                             
3
iex(18)> Counter.dec(SupCounter)  
:ok

19:32:10.969 [error] GenServer SupCounter terminating
** (FunctionClauseError) no function clause matching in Counter.handle_cast/2
    (counter) lib/counter.ex:25: Counter.handle_cast(:dec, 3)
    (stdlib) gen_server.erl:615: :gen_server.try_dispatch/4
    (stdlib) gen_server.erl:681: :gen_server.handle_msg/5
    (stdlib) proc_lib.erl:240: :proc_lib.init_p_do_apply/3
Last message: {:"$gen_cast", :dec}
State: 3
iex(19)> Counter.value(SupCounter)
0
iex(20)> Counter.inc(SupCounter)  
:ok
iex(21)> Counter.inc(SupCounter)
:ok
iex(22)> Counter.inc(SupCounter)
:ok

```
