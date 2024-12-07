# test/game_test.exs
defmodule TicTacToe.GameTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import Mock
  alias TicTacToe.Game
  alias TicTacToe.Board

  describe "player switching" do
    test "alternates between X and O players" do
      # Mock the board and move functions to track player switches
      board = Board.initialize()

      # A mock implementation that tracks player switches
      defmodule PlayerTracker do
        def track_players do
          agent_name = __MODULE__
          Agent.start_link(fn -> %{players: [], moves: 0} end, name: agent_name)
          agent_name
        end

        def record_player(player) do
          Agent.update(__MODULE__, fn state ->
            %{
              players: state.players ++ [player],
              moves: state.moves + 1
            }
          end)
        end

        def get_player_sequence do
          Agent.get(__MODULE__, & &1.players)
        end

        def stop do
          Agent.stop(__MODULE__)
        end
      end

      # Start tracking
      tracker = PlayerTracker.track_players()

      # Mock board and move functions to track players
      board_mock = %{
        Board => [
          place_move: fn board, position, player ->
            PlayerTracker.record_player(player)
            {:ok, Map.put(board, position, player)}
          end
        ]
      }

      # Simulate game with mocked dependencies
      moves = [5, 1, 2, 4, 3]
      {:ok, input_pid} = StringIO.open(Enum.map_join(moves, &"#{&1}\n"))

      try do
        capture_io([input: input_pid], fn ->
          with_mocks board_mock do
            Game.play()
          end
        end)

        # Get the sequence of players
        player_sequence = PlayerTracker.get_player_sequence()

        # Verify player switching
        assert Enum.at(player_sequence, 0) == "X"
        assert Enum.at(player_sequence, 1) == "O"
        assert Enum.at(player_sequence, 2) == "X"
        assert Enum.at(player_sequence, 3) == "O"
        assert Enum.at(player_sequence, 4) == "X"
      after
        # Clean up
        StringIO.close(input_pid)
        PlayerTracker.stop()
      end
    end
  end
end
