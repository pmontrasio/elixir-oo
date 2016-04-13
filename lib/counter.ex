defmodule Counter do
  use GenServer

  # initialize
  def start_link(counter, opts \\ []) do
    # We use __MODULE__ for the same reason we use self in "def self.class_method" in Ruby
    # We set the initial state at counter
    GenServer.start_link(__MODULE__, counter, opts)
    # It returns {:ok, pid}
  end

  def inc(pid) do
    GenServer.cast(pid, :inc)
  end

  def dec(pid) do
    GenServer.cast(pid, :dec) # this will break the server
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
