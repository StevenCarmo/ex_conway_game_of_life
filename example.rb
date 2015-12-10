require_relative './lib/conway_game_of_life.rb'

def get_user_input(message, default_value)
  print message
  value = gets.chomp

  return default_value if value == ''
end

def run_gol_setup
  puts "\nPlease setup your Game of Life board:"
  rows = get_user_input("Board rows (30): ", 30)
  columns = get_user_input("Board columns (30): ", 30)
  seeds = get_user_input("Seeds (60): ", 100)
  iterations = get_user_input("Iterations (100): ", 100)

  puts "Conways game of life is starting..."
  board = Board.new({rows: rows, columns: columns})
  board.seed_cells(seeds)

  puts "\ngenerating a #{rows} by #{columns} board..."
  sleep 2

  for i in 0..iterations
    board.print_board
    BoardStep.next(board)
    sleep 1
    puts "\n\n\n\n\n\n\n\n"
  end

end

run_gol_setup
