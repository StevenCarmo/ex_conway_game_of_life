# RULES
# Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by over-population.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

class Board

  attr_reader :rows, :columns, :cells

  def initialize( options={} )
    @rows = options[:rows] || 20
    @columns = options[:columns] || 20
    @cells = Array.new(@rows) { Array.new(@columns) { Cell.new } }
  end

  def get_cell(row, column)
    if (0..(@rows - 1)) === row && (0..(@columns - 1)) === column
      return @cells[row][column]
    end
  end

end

module BoardStep
  class << self

    def get_cell_neighbors(board, cell_location)
      row = cell_location.fetch(:row)
      column = cell_location.fetch(:column)
      neighbors = []

      neighbors << board.get_cell(row - 1, column - 1)  #NW
      neighbors << board.get_cell(row - 1, column)      #N
      neighbors << board.get_cell(row - 1, column + 1)  #NE
      neighbors << board.get_cell(row, column - 1)      #W
      neighbors << board.get_cell(row, column + 1)      #E
      neighbors << board.get_cell(row + 1, column - 1)  #SW
      neighbors << board.get_cell(row + 1, column)      #S
      neighbors << board.get_cell(row + 1, column + 1)  #SE

      # remove the nils
      return neighbors.compact
    end

  end
end

class Cell

  def initialize(active=false)
    @active = active
  end

  def is_active?
    return true if @active == true
    false
  end

  def activate!
    @active = true
    return self
  end

  def deactivate!
    @active = false
    return self
  end

end
