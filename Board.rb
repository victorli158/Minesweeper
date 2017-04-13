require_relative "Tile.rb"

class Board
  attr_reader :grid


  def self.empty_grid
    Array.new(9) do
      Array.new(9) { Tile.new }
    end
  end

  def self.bombed
    self.new(self.empty_grid, true)
  end

  def initialize(grid = self.class.empty_grid, bombed = false)
    @grid = grid
    bomb_grid if bombed
  end

  def bomb_grid(count = 9)
    count.times {place_bomb}
  end

  def empty?(pos)
    self[pos].bombed == false
  end

  def place_bomb
    pos = random_pos

    until empty?(pos)
      pos = random_pos
    end

    self[pos].bombed = true

  end

  def random_pos
    [rand(size), rand(size)]
  end

  def size
    grid.length
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def display
    header = (0...9).to_a.join("  ")
    puts "   #{header}"
    grid.each_with_index { |row, i| display_row(row, i) }
    puts
  end

  def display_row(row, i)
    chars = row.map { |tile| tile.symbol_render }.join("  ")
    puts "#{i}  #{chars}"
  end


  # def render
  #   puts "  #{(0..8).to_a.join(" ")}"
  #   grid.each_with_index do |row, i|
  #     puts "#{i} #{row.join(" ")}"
  #   end
  # end

  # def []=(pos, options = {})
  #   x, y = pos
  #   grid[x][y] = options
  #   tile.revealed = options[:revealed]
  #   tile.flagged = options[:flagged]
  # end

  def rows
    @grid
  end

  def columns
    rows.transpose!
  end

end
