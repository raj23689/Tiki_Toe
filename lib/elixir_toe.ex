# lib/lib.ex
defmodule Elixir_Toe.App do
  @moduledoc """
  Main entry point for the Tic-Tac-Toe application
  """
  def start(_start_type, _start_args) do
    # code
    main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main() do
    IO.puts("\n")
    IO.puts("\n")
    IO.puts("#######################")
    IO.puts("Welcome to Tic-Tac-Toe!")
    IO.puts("#######################")
    TicTacToe.Game.play()
  end
end
