defmodule CounterSupervisor do
  use Supervisor

  def start_link(name) do
    Supervisor.start_link(__MODULE__, [name: name])
  end

  def init([name: name]) do
    children = [ worker(Counter, [name]) ]

    supervise(children, strategy: :one_for_one)
  end
end

# iex(1)> CounterSupervisor.start_link(Name)
# {:ok, #PID<0.101.0>}
# iex(2)> Counter.value(Name)
# 0
# iex(3)> CounterSupervisor.start_link(Name2)
# {:ok, #PID<0.105.0>}
# iex(4)> Counter.value(Name2)
# 0
# iex(5)> Counter.inc(Name)
# :ok
# iex(6)> Counter.inc(Name)
# :ok
# iex(7)> Counter.inc(Name)
# :ok
# iex(8)> Counter.inc(Name)
# :ok
# iex(9)> Counter.inc(Name2)
# :ok
# iex(10)> Counter.inc(Name2)
# :ok
# iex(11)> Counter.value(Name)
# 4
# iex(12)> Counter.value(Name2)
# 2
# iex(13)> :observer.start
