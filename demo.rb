require_relative "counter"

# Ruby                       # Elixir
# method calling style
counter_1 = Counter.new      # {:ok, counter_1} = Counter.start_link()
puts counter_1.value         # IO.puts Counter.value(counter_1)
counter_1.inc                # Counter.inc(counter_1)
puts counter_1.value         # IO.puts Counter.value(counter_1)

# Ruby                       # Elixir
# message passing style      # |> style
counter_2 = Counter.new      # {:ok, counter_2} = Counter.start_link()
puts counter_2.send(:value)  # IO.puts counter_2 |> Counter.value
counter_2.send(:inc)         # counter_2 |> Counter.inc
puts counter_2.send(:value)  # IO.puts counter_2 |> Counter.value
