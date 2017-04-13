require_relative 'Board.rb'
require_relative 'Game.rb'

class Tile

  attr_accessor :bombed, :flagged, :revealed

  DISPLAY_HASH = {
    unexplored: "*",
    interior: "_",
    flagged: "F",
    fringe: {}
  }

  def initialize
    @bombed = false
    @flagged = false
    @revealed = false
  end

  def reveal
    if @bombed
      # board.lost
    else
      @revealed = true
      reveal_neighbors
    end

  end

  def flag
    @flagged = true
  end

  def unflag
    @flagged = false
  end

  def reveal_neighbors
  end

  def symbol_render
    if self.flagged
      DISPLAY_HASH[:flagged]
    elsif self.revealed == false
      DISPLAY_HASH[:unexplored]
    end
  end

end
