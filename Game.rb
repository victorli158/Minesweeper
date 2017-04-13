require_relative "Tile.rb"
require_relative "Board.rb"

class Game
  attr_reader :board

  def initialize(board = Board.random)
    @board = board
  end

  def play
    play_turn until game_won? || game_lost?
  end

end
