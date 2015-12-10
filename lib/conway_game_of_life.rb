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

    def next(board)
      cell_actions = build_next_step(board)

      cell_actions.each do |cell_action|
        cell_action[:cell].activate! if cell_action[:action] == 'activate'
        cell_action[:cell].deactivate! if cell_action[:action] == 'deactivate'
      end

      return true
    end

    private

    def build_next_step(board)
      cell_actions = []

      (0..(board.rows - 1)).each do |row|
        (0..(board.columns - 1)).each do |column|
          next_cell_action = get_next_cell_action(board, {row: row, column: column})
          unless next_cell_action[:action].nil?
            cell_actions << next_cell_action
          end
        end
      end

      return cell_actions
    end

    def get_next_cell_action(board, cell_location)
      row = cell_location.fetch(:row)
      column = cell_location.fetch(:column)
      cell = board.get_cell(row, column)
      active_neighbors_count = 0

      get_cell_neighbors(board, cell_location).each {|cell_neighbor| active_neighbors_count += 1 if cell_neighbor.is_active? }

      return {cell: cell, action: get_cell_action(cell, active_neighbors_count)}
    end

    def get_cell_action(cell, active_neighbors_count)
      # Based On Conways's rules
      if cell.is_active?
        if active_neighbors_count <= 1
          return 'deactivate'
        elsif active_neighbors_count <= 3
          return nil
        else
          return 'deactivate'
        end
      else
        if active_neighbors_count == 3
          return 'activate'
        end
      end
    end

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
