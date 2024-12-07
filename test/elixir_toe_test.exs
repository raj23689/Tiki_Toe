defmodule ElixirToeTest do
  use ExUnit.Case
  doctest ElixirToe

  test "greets the world" do
    assert ElixirToe.hello() == :world
  end
end
