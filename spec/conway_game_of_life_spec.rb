require_relative '../lib/conway_game_of_life.rb'

describe Board do
  let(:subject) { Board.new }

  it "has a valid class" do
    expect(subject.class.to_s).to eq 'Board'
  end

  describe 'attributes' do
    it 'allows reading of :rows' do
      expect(subject.rows).not_to be nil
    end

    it 'allows reading of :columns' do
      expect(subject.columns).not_to be nil
    end
  end

  describe '.initialize' do

    context 'when initialized without options' do
      it 'generates a default row count' do
        expect(subject.rows).to be > 0
      end

      it 'generates a default column count' do
        expect(subject.columns).to be > 0
      end
    end

    it 'generates an array of Cells' do
      expect(subject.cells).to be_a_kind_of(Array)
      expect(subject.cells[0][0]).to be_a_kind_of(Cell)
    end

  end

  describe '#get_cell' do
    context 'when given a valid cell location' do
      it 'returns the cell' do
        expect(subject.get_cell(1,1)).to be_a_kind_of(Cell)
      end
    end
    context 'when given a invalid cell location' do
      it 'returns nil' do
        expect(subject.get_cell(11111,1)).to be_nil
      end
    end
  end

end

describe BoardStep do
  let(:subject) { BoardStep }

  it "is a Module" do
    expect(subject.class.to_s).to eq 'Module'
  end

  describe '#get_cell_neighbors' do
    it 'returns an array of neighboring cells' do
      expect(subject.send(:get_cell_neighbors, Board.new, {row: 0, column: 0}).length).to eq 3
      expect(subject.send(:get_cell_neighbors, Board.new, {row: 0, column: 1}).length).to eq 5
      expect(subject.send(:get_cell_neighbors, Board.new, {row: 1, column: 1}).length).to eq 8
    end
  end

end

describe Cell do
  let(:subject) { Cell.new }

  it "has a valid class" do
    expect(subject.class.to_s).to eq 'Cell'
  end

  describe '.initialize' do
    it 'defaults active attribute to false' do
      expect(subject.is_active?).to be false
    end

    context 'given an active parameter of true' do
      let(:subject) { Cell.new(true) }

      it 'sets active attribute to true' do
        expect(subject.is_active?).to be true
      end

    end
  end

  describe '#activate!' do

    it 'sets active attribute to true' do
      subject.activate!
      expect(subject.is_active?).to be true
    end

    it 'and returns cell' do
      expect(subject.activate!).to be_a_kind_of(Cell)
    end

  end

  describe '#deactivate!' do
    it 'sets active attribute to false' do
      subject.deactivate!
      expect(subject.is_active?).to be false
    end
  end

end
