# lib/board.ex
defmodule TicTacToe.Board do
  @doc """
  Initialize an empty 3x3 board
  """
  def initialize do
    %{
      1 => " ",
      2 => " ",
      3 => " ",
      4 => " ",
      5 => " ",
      6 => " ",
      7 => " ",
      8 => " ",
      9 => " "
    }
  end

  @doc """
  Check if the board is full (draw condition)
  """
  def full?(board) do
    Enum.all?(Map.values(board), fn cell -> cell != " " end)
  end

  @doc """
  Check for winning combinations
  """
  def winner?(board, player) do
    winning_combinations = [
      # Rows
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      # Columns
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      # Diagonals
      [1, 5, 9],
      [3, 5, 7]
    ]

    Enum.any?(winning_combinations, fn combo ->
      Enum.all?(combo, fn pos -> board[pos] == player end)
    end)
  end

  @doc """
  Place a move on the board
  """
  def place_move(board, position, player) do
    if board[position] == " " do
      {:ok, Map.put(board, position, player)}
    else
      {:error, "Position already taken"}
    end
  end
end
