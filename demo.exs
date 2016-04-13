# iex -S mix run demo.exs

# Elixir                                                              # Ruby
import Supervisor.Spec
default_value = 0
children = [worker(Counter,[default_value, [name: :counter]])]
{:ok, _} = Supervisor.start_link(children, strategy: :one_for_one)    # counter = Counter.new
Counter.inc(:counter)                                                 # counter.inc
IO.puts Counter.value(:counter)                                       # puts counter.value
Counter.inc(:counter)                                                 # counter.inc
IO.puts Counter.value(:counter)                                       # puts counter.value
Counter.dec(:counter)                 # this raises an error and will terminate the script

# if you run the commands from iex -S mix you'll be able to do this:
IO.puts Counter.value(:counter)       # the counter is restarted with default_value
