defmodule CounterApp do
  use Application
  import Supervisor.Spec

  def start(_type, _args) do
    default_value = 0
    children = [worker(Counter,[default_value, [name: :counter]])]
    Supervisor.start_link(children, strategy: :one_for_one)
  end

end
