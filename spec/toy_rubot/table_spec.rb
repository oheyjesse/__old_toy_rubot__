RSpec.describe ToyRubot::Table do
  let(:table) { ToyRubot::Table.new }

  describe 'init' do
    it 'can instantiate an instance of Table' do
      expect(table).to be_an_instance_of(ToyRubot::Table)
    end

    it 'can have a default size if none supplied' do
      expect(table.size).to eq(x: 4, y: 4)
    end

    it 'can instantiate with size if supplied' do
      table = ToyRubot::Table.new(x: 15, y: 15)
      expect(table.size).to eq(x: 15, y: 15)
    end
  end

  describe '.set_size' do
    it 'can change it\'s size' do
      table.set_size(x: 10, y: 10)
      expect(table.size).to eq(x: 10, y: 10)
    end

    it 'set_size error handling' do
      expect { table.set_size("hello", 10) }.to raise_error(ArgumentError)
      expect { table.set_size(10) }.to raise_error(ArgumentError)
    end
  end

  describe '.in_bounds?' do
    it 'returns true if in-bounds values supplied' do
      expect(table.in_bounds?(x: 2, y: 2)).to be(true)
    end

    it 'returns false if out-of-bounds values supplied' do
      expect(table.in_bounds?(x: 15, y: 15)).to be(false)
    end

    it 'returns false if negative values supplied' do
      expect(table.in_bounds?(x: -15, y: -15)).to be(false)
    end

    it 'returns false if X out of bounds' do
      expect(table.in_bounds?(x: 15, y: 2)).to be(false)
    end

    it 'returns false if Y out of bounds' do
      expect(table.in_bounds?(x: 2, y: 15)).to be(false)
    end

  end
end
