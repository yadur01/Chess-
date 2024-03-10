class ChessGame
  attr_reader :board, :current_player, :opponent_player

  def initialize
    @board = Array.new(8) { Array.new(8) }
    setup_board
    @current_player = :white
    @opponent_player = :black
  end

  def start
    puts "Welcome to Chess!"
    display_board

    until game_over?
      puts "#{current_player.capitalize}'s turn"
      move_piece
      switch_players
      display_board
    end

    puts "Checkmate! #{opponent_player.capitalize} wins!"
  end

  private

  def setup_board
    # Setup initial pieces positions
    # This is just a basic setup, feel free to customize
    # You can use letters to represent pieces
    # R - rook, N - knight, B - bishop, Q - queen, K - king, P - pawn
    board[0] = ["R", "N", "B", "Q", "K", "B", "N", "R"]
    board[1] = ["P"] * 8
    board[6] = ["p"] * 8
    board[7] = ["r", "n", "b", "q", "k", "b", "n", "r"]
  end

  def display_board
    board.each do |row|
      puts row.map { |piece| piece || "-" }.join(" ")
    end
  end

  def a2move_piece
    puts "Enter move (e.g. 'a2 a4'):"
    move = gets.chomp.split

    # Convert from chess coordinates to array indices
    from = chess_to_indices(move[0])
    to = chess_to_indices(move[1])

    # Check if the move is valid
    if valid_move?(from, to)
      board[to[0]][to[1]] = board[from[0]][from[1]]
      board[from[0]][from[1]] = nil
    else
      puts "Invalid move! Try again."
      move_piece
    end
  end

  def valid_move?(from, to)
    # Basic validation, you can add more complex logic here
    piece = board[from[0]][from[1]]
    return false if piece.nil?

    # For now, allow any move
    true
  end

  def chess_to_indices(chess_pos)
    # Convert chess coordinates to array indices
    col = chess_pos[0].ord - "a".ord
    row = 8 - chess_pos[1].to_i
    [row, col]
  end

  def game_over?
    # For simplicity, always return false
    false
  end

  def switch_players
    @current_player, @opponent_player = @opponent_player, @current_player
  end
end

# Start the game
game = ChessGame.new
game.start