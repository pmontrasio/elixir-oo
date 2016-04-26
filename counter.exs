# iex counter.exs
defmodule Counter do
  def start_link do
    server(0)
  end
  def server(value) do
    receive do
      :inc -> server(value + 1)
      {:value, client} ->
        send(client, value)
        server(value)
    end
  end
end

counter_1 = spawn fn -> Counter.start_link end
send(counter_1, :inc)
send(counter_1, {:value, self()})
receive do
  value -> IO.puts value
end
