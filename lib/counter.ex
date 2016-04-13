defmodule Counter do
  use GenServer

  # initialize
  def start_link() do
    # We use __MODULE__ for the same reason we use self in "def self.class_method" in Ruby
    # We set the initial state at 0
    GenServer.start_link(__MODULE__, 0)
    # It returns {:ok, pid}
  end

  def inc(pid) do
    GenServer.cast(pid, :inc)
  end

  def value(pid) do
    GenServer.call(pid, :value)
  end

  # The implementation
  def handle_cast(:inc, counter) do
    # :noreply is part of the GenServer protocol
    # It tells GenServer not to answer to the client
    # and update the state with arg 1
    {:noreply, counter + 1}
  end

  def handle_call(:value, _client, counter) do
    # :reply is part of the GenServer protocol
    # It tells GenServer to answer to _client with arg 1
    # and update the state with arg 2
    {:reply, counter, counter}
  end

end
