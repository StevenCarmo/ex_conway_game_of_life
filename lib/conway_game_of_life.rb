# RULES
# Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by over-population.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

class Board

  attr_reader :rows, :columns

  def initialize( options={} )
    @rows = options[:rows] || 20
    @columns = options[:columns] || 20
    @cells = Array.new(@rows) { Array.new(@columns) } #Add cells
  end

  def get_cells
    return @cells
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
