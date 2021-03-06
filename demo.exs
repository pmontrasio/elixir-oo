# iex -S mix run demo.exs

# Elixir                                 # Ruby
{:ok, counter_1} = Counter.start_link()  # counter_1 = Counter.new
Counter.inc(counter_1)                   # counter_1.inc
IO.puts Counter.value(counter_1)         # puts counter_1.value
Counter.inc(counter_1)                   # counter_1.inc
IO.puts Counter.value(counter_1)         # puts counter_1.value

# extra: terminate the counter_1 process
GenServer.stop(counter_1)                # no Ruby equivalent, but look at
                                         # http://ruby-doc.org/stdlib-2.3.0/libdoc/drb/rdoc/DRb.html
                                         # for Ruby objects running in separate processes (not lightweight)

# this fails because there is no counter_1 anymore
IO.puts Counter.value(counter_1)
