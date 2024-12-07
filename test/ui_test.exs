defmodule TicTacToe.UITest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias TicTacToe.UI

  describe "print_board/1" do
    test "prints the board correctly" do
      board = %{
        1 => "X",
        2 => "O",
        3 => " ",
        4 => " ",
        5 => "X",
        6 => " ",
        7 => " ",
        8 => "O",
        9 => " "
      }

      output =
        capture_io(fn ->
          UI.print_board(board)
        end)

      assert output == """
             X|O|
             -+-+-
              |X|
             -+-+-
              |O|
             """
    end
  end

  describe "get_move/0" do
    test "returns valid move for correct input" do
      # Simulate user input
      input = "5\n"

      # Temporarily replace IO.gets to return our predefined input
      {:ok, pid} = StringIO.open(input)

      try do
        # Redirect IO to our StringIO
        io_result = IO.read(pid, :line)
        assert_receive {:io_request, _, _, {:get_line, _}}

        # Call the function
        assert {:ok, 5} = UI.get_move()
      after
        # Clean up
        StringIO.close(pid)
      end
    end

    test "handles invalid input" do
      # Simulate invalid inputs
      invalid_inputs = ["a\n", "10\n", "-1\n"]

      Enum.each(invalid_inputs, fn input ->
        {:ok, pid} = StringIO.open(input)

        try do
          assert {:error, "Invalid input"} = UI.get_move()
        after
          StringIO.close(pid)
        end
      end)
    end
  end
end
