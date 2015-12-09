class Board

  attr_accessor :cells

  def initialize
    @rows = 20
    @columns = 20
    @cells = Array.new(@rows) { Array.new(@columns) { |i| Cell.new }}
  end

  def cell(row=0, column=0)

  end

  def cell_neighbors()

    return 3

  end

  def next_round_cell(cell, active_neighbors_count=0)

    if cell.is_active? and active_neighbors_count < 2
      cell.deactivate!
    

    elsif cell.is_active?
      if active_neighbors_count == 2 or active_neighbors_count == 3
        return cell
      end
    end

    # active < 2 = dies
    # active > 2 < = lives
    # active > 3 = dies
    # inactive = 3 = lives

  end

  # Any live cell with fewer than two live neighbours dies, as if caused by under-population.
  # Any live cell with two or three live neighbours lives on to the next generation.
  # Any live cell with more than three live neighbours dies, as if by over-population.
  # Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.


end

class Cell

  attr_reader :active

  def initialize
    @active = false
  end

  def is_active?
    return true if self.active == true
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


#  Round
class BoardState



end
