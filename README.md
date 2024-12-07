# Tiki-Toe Elixir Game

A command-line Tic-Tac-Toe game implemented in Elixir, showcasing functional programming principles and comprehensive testing.

## 🎮 Game Overview

This Tic-Tac-Toe implementation provides a simple, interactive console-based game where two players (X and O) take turns marking positions on a 3x3 grid.

## 📂 Project Structure

```
tiki_toe/
│
├── lib/
│   ├── board.ex       # Board state and game logic
│   ├── game.ex        # Game flow and turn management
│   ├── lib.ex         # Main application entry point
│   └── ui.ex          # User interface and input handling
│
├── test/
│   ├── board_test.exs # Tests for board-related functions
│   ├── game_test.exs  # Tests for game flow
│   └── ui_test.exs    # Tests for user interface
│
└── mix.exs            # Project configuration
```

## 🚀 Installation

### Prerequisites

- Elixir (version 1.12 or higher)
- Erlang/OTP (compatible version)

### Setup Steps

1. Clone the repository:
```bash
git clone https://github.com/raj23689/tiki_toe.git
cd tic_tac_toe
```

2. Install dependencies:
```bash
mix deps.get
```

## 🎲 How to Play

### Running the Game

```bash
# Build the executable
mix escript.build

# Run the game
./elixir_toe
```

### Game Instructions

- Players take turns entering numbers 1-9
- Each number corresponds to a board position:
```
1|2|3
-+-+-
4|5|6
-+-+-
7|8|9
```
- First player to get 3 in a row wins!

## 🧪 Running Tests

```bash
# Run all tests
mix test

# Generate test coverage report
mix coveralls.html
```

## 📊 Test Coverage

Our test suite covers:
- Board initialization
- Move validation
- Winning condition detection
- User interface interactions
- Game flow management

### Test Modules

1. `BoardTest`: 
   - Checks board creation
   - Validates win detection
   - Verifies move placement

2. `UITest`:
   - Tests board printing
   - Validates user input
   - Simulates interactions

3. `GameTest`:
   - Simulates complete game scenarios
   - Verifies game flow
   - Checks player switching

## 🛠 Development

### Key Components

- `Board` module: Manages game state
- `UI` module: Handles user interactions
- `Game` module: Implements game logic
- `App` module: Entry point for execution

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📜 License

Distributed under the MIT License. See `[LICENSE](./LICENSE)` for more information.

## 🎈 Acknowledgments

- Elixir Community
- Functional Programming Principles
- Interactive Console Game Design

---

**Enjoy playing Tiki-Toe!** 🎲🏁