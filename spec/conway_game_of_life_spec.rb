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

  # describe '#generate_temp_cells' do
  #   it 'creates an array from :rows :columns ' do
  #     expect(subject.send(:generate_temp_cells)).to be_a_kind_of(Array)
  #   end
  # end

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
