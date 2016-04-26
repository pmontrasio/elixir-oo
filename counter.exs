# iex counter.exs
defmodule Counter do
  def start_link do
    server(0)
  end
  def server(counter) do
    receive do
      :inc -> server(counter + 1)
      {:value, client} ->
        send(client, counter)
        server(counter)
    end
  end
end

counter_1 = spawn fn -> Counter.start_link end
send(counter_1, :inc)
send(counter_1, {:value, self()})
receive do
  counter -> IO.puts counter
end
