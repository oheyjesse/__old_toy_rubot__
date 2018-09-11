RSpec.describe ToyRubot::Table do
  let(:table) { ToyRubot::Table.new }

  it 'can instantiate an instance of Table' do
    expect(table).to be_an_instance_of(ToyRubot::Table)
  end

  describe '.set_size' do
    it 'has a default size if none supplied' do
      table = ToyRubot::Table.new
      expect(table.size).to eq([4, 4])
    end

    it 'can change it\'s size' do
      table.set_size(10, 10)
      expect(table.size).to eq([10, 10])
    end
  end

  describe '.set_size error handling' do
    it 'raises an error if non-integer values supplied to set_size' do
      expect { table.set_size("hello", 10) }.to raise_error(ArgumentError)
    end
  end

  describe '.in_bounds?' do
    it 'returns true if in-bounds values supplied' do
      expect(table.in_bounds?(2, 2)).to be(true)
    end

    it 'returns false if out-of-bounds values supplied' do
      expect(table.in_bounds?(10, 10)).to be(false)
    end

    it 'returns false if out-of-bounds values supplied' do
      expect(table.in_bounds?(10, 10)).to be(false)
    end
  end
end
