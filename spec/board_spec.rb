require_relative '../lib/board.rb'

describe Board do
  let(:subject) {Board.new }

  it "has a valid class" do
    expect(subject.class.to_s).to eq 'Board'
  end

  it "has cells" do
    expect(subject.cells).not_to eq nil
  end

  it "deactivates if less than 2 active neighbors" do
    cell = Cell.new
    cell.activate!
    active_neighbors_count = 1

    expect(subject.next_round_cell(cell, active_neighbors_count).is_active?).to eq false

  end


  it "remains active if has 2 active neighbors" do
    cell = Cell.new
    cell.activate!
    # active_neighbors_count = 1

    expect(subject.next_round_cell(cell, 2).is_active?).to eq true

  end

  # it "remains active if has 3 active neighbors" do
  #   cell = Cell.new
  #   cell.activate!
  #   # active_neighbors_count = 1
  #
  #   expect(subject.next_round_cell(cell, 2).is_active?).to eq false
  #   expect(subject.next_round_cell(cell, 3).is_active?).to eq false
  #
  # end


end

describe Cell do
  let(:subject) {Cell.new }

  it "has a valid class" do
    expect(subject.class.to_s).to eq 'Cell'
  end

  it "active defaults to false" do
    expect(subject.active).to eq false
  end

  # it "has cells" do
  #   expect(subject.cells).not_to eq nil
  # end


end
