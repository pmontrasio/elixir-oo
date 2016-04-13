defmodule CounterTest do
  use ExUnit.Case
  doctest Counter

  setup do
    {:ok, counter} = Counter.start_link()
    {:ok, counter: counter}
  end

  test "it starts with zero", %{counter: counter} do
    assert Counter.value(counter) == 0
  end

  test "it increments by one", %{counter: counter} do
    Counter.inc(counter)
    assert Counter.value(counter) == 1
    Counter.inc(counter)
    assert Counter.value(counter) == 2
  end

end
