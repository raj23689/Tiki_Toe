# lib/ui.ex
defmodule TicTacToe.UI do
  @doc """
  Print the current board state
  """
  def print_board(board) do
    IO.puts("""
    #{board[1]}|#{board[2]}|#{board[3]}
    -+-+-
    #{board[4]}|#{board[5]}|#{board[6]}
    -+-+-
    #{board[7]}|#{board[8]}|#{board[9]}
    """)
  end

  @doc """
  Get player move input
  """
  def get_move do
    IO.gets("Enter your move (1-9): ")
    |> String.trim()
    |> Integer.parse()
    |> handle_move_input()
  end

  defp handle_move_input({move, ""}) when move >= 1 and move <= 9, do: {:ok, move}
  defp handle_move_input(_), do: {:error, "Invalid input"}
end
