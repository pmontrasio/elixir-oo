# Elixir's object orientation - Step 2

This is both a Ruby and an Elixir project.

It demostrates the mapping between Ruby's objects and Elixir's GenServer processes.
Ruby's class definitions and method calls are shown to map to GenServer function.

In general this mapping applies to any object oriented language. Ruby is particularly convenient for this example because Elixir has been designed with a Ruby-like syntax.

What can't be mapped to Elixir is the direct access to object attributes: we must call a function to access to the state of a GenServer.

Actually this could be a more faithful to the original meaning of object orientation:

> OOP to me means only messaging, local retention and protection and hiding of state-process, and extreme late-binding of all things. It can be done in Smalltalk and in LISP.

-- Alan Kay, one of fathers of object oriented programming, http://www.purl.org/stefan_ram/pub/doc_kay_oop_en

# Step 2

To go back to the first step, ```git checkout master``` and read the README.

This step adds a supervisor process to restart the counter process whenever it crashes.
It's like an object that is never destroyed.
However the internal state of the counter is reset to its initial value after a restart.

# Demo

For the Ruby part

     rvm use 2.3.0@counter-demo
     bundle install
     rspec
     ruby demo.rb

For the Elixir part

     mix test
     iex -S mix run demo.exs

```demo.exs``` will terminate with an error. That's part of the demo. Look at the code.

# Code

Ruby class definition at ```counter.rb```. Elixir module definition at ```lib/counter.ex```.

Demos with the equivalent statements in the other language in the comments: ```demo.rb``` and ```demo.exs```.

Ruby tests: ```spec/counter_spec.rb```. Elixir tests: ```tests/counter_test.exs```.
