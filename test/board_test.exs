defmodule TicTacToe.BoardTest do
  use ExUnit.Case
  alias TicTacToe.Board

  describe "initialize/0" do
    test "creates an empty 3x3 board" do
      board = Board.initialize()

      assert map_size(board) == 9

      Enum.each(board, fn {_, value} ->
        assert value == " "
      end)
    end
  end

  describe "full?/1" do
    test "returns false for an empty board" do
      board = Board.initialize()
      refute Board.full?(board)
    end

    test "returns true for a completely filled board" do
      full_board = %{
        1 => "X",
        2 => "O",
        3 => "X",
        4 => "O",
        5 => "X",
        6 => "O",
        7 => "X",
        8 => "O",
        9 => "X"
      }

      assert Board.full?(full_board)
    end

    test "returns false for a partially filled board" do
      partial_board = %{
        1 => "X",
        2 => "O",
        3 => " ",
        4 => "O",
        5 => "X",
        6 => " ",
        7 => "X",
        8 => " ",
        9 => " "
      }

      refute Board.full?(partial_board)
    end
  end

  describe "winner?/2" do
    test "detects horizontal win in first row" do
      board = %{
        1 => "X",
        2 => "X",
        3 => "X",
        4 => " ",
        5 => " ",
        6 => " ",
        7 => " ",
        8 => " ",
        9 => " "
      }

      assert Board.winner?(board, "X")
      refute Board.winner?(board, "O")
    end

    test "detects vertical win in second column" do
      board = %{
        1 => " ",
        2 => "O",
        3 => " ",
        4 => " ",
        5 => "O",
        6 => " ",
        7 => " ",
        8 => "O",
        9 => " "
      }

      assert Board.winner?(board, "O")
      refute Board.winner?(board, "X")
    end

    test "detects diagonal win" do
      board = %{
        1 => "X",
        2 => " ",
        3 => " ",
        4 => " ",
        5 => "X",
        6 => " ",
        7 => " ",
        8 => " ",
        9 => "X"
      }

      assert Board.winner?(board, "X")
      refute Board.winner?(board, "O")
    end

    test "returns false for no winner" do
      board = Board.initialize()
      refute Board.winner?(board, "X")
      refute Board.winner?(board, "O")
    end
  end

  describe "place_move/3" do
    test "successfully places move on empty position" do
      board = Board.initialize()
      {:ok, new_board} = Board.place_move(board, 5, "X")

      assert new_board[5] == "X"
      assert new_board != board
    end

    test "returns error when position is already taken" do
      board = %{1 => "X", 2 => " ", 3 => " "}
      {:error, message} = Board.place_move(board, 1, "O")

      assert message == "Position already taken"
    end
  end
end
