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

    it 'generates a cells array' do
      expect(subject.get_cells).to be_a_kind_of(Array)
    end

    context 'when initialized without options' do
      it 'generates a default row count' do
        expect(subject.rows).to be > 0
      end

      it 'generates a default column count' do
        expect(subject.columns).to be > 0
      end
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
