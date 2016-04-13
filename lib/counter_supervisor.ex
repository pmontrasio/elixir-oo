defmodule CounterSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [ worker(Counter, [XY]) ]

    supervise(children, strategy: :one_for_one)
  end
end

# iex(1)> CounterSupervisor.start_link
# {:ok, #PID<0.89.0>}
# iex(2)> Counter.value(XY)
# 0
# iex(3)> Counter.inc(XY)
# :ok
# iex(4)> Counter.value(XY)
# 1
# iex(5)> Counter.dec(XY)
# error...
