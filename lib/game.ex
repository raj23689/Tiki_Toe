# lib/game.ex
defmodule TicTacToe.Game do
  alias TicTacToe.Board
  alias TicTacToe.UI

  @doc """
  Start and play the game
  """
  def play do
    board = Board.initialize()
    play_turn(board, "X")
  end

  defp play_turn(board, current_player) do
    UI.print_board(board)
    IO.puts("Player #{current_player}'s turn")

    case UI.get_move() do
      {:ok, move} ->
        handle_move(board, move, current_player)

      {:error, message} ->
        IO.puts(message)
        play_turn(board, current_player)
    end
  end

  defp handle_move(board, move, current_player) do
    case Board.place_move(board, move, current_player) do
      {:ok, new_board} ->
        cond do
          Board.winner?(new_board, current_player) ->
            UI.print_board(new_board)
            IO.puts("Player #{current_player} wins!")

          Board.full?(new_board) ->
            UI.print_board(new_board)
            IO.puts("It's a draw!")

          true ->
            play_turn(new_board, next_player(current_player))
        end

      {:error, message} ->
        IO.puts(message)
        play_turn(board, current_player)
    end
  end

  defp next_player("X"), do: "O"
  defp next_player("O"), do: "X"
end
