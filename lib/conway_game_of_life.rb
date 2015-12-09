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
