require_relative '../enumerable'
describe Enumerable do
  let(:array) { [1, 2, 3, 4, 5] }
  let(:array2) { [1, 2, 3, 4, 6] }

  describe '#my_each' do
    it 'returns an enumerator class' do
      expect(array.my_each.class).to eq(array.each.class) # positive
      expect(array.my_each.class).not_to eq('Integer') # negative
    end
    it 'returns the array' do
      expect(array.my_each { |num| num }).to eq(array)
      expect(array.my_each { |num| num }).not_to eq(array2)
    end
  end

  describe '#my_each_with_index' do
    it 'returns an enumerator class' do
      expect(array.my_each_with_index.class).to eq(array.my_each_with_index.class) # positive
      expect(array.my_each_with_index.class).not_to eq('Integer') # negative
    end
    it 'returns the array' do
      expect(array.my_each_with_index { |num| num }).to eq(array) # positive
      expect(array.my_each_with_index { |num| num }).not_to eq(array2) # negative
    end
  end

  describe '#my_select' do
    it 'returns only odd numbers in the array of the class' do
      expect(array.my_select(&:odd?)).to eq([1, 3, 5]) # positive
      expect(array.my_select(&:odd?)).not_to eq([1, 3, 5, 2, 6]) # negative
    end
    it 'returns only even numbers in the array of the class' do
      expect(array.my_select(&:even?)).to eq([2, 4]) # positive
      expect(array.my_select(&:even?)).not_to eq([2, 4, 1, 5]) # negative
    end
  end

  describe '#my_all' do
    it 'returns true if the block never returns false or nil' do
      expect([1].all?(Integer)).to eql(true) # positive
    end
    it 'returns true if the block never returns false or nil' do
      expect([1].my_all?(Integer)).to eql(true)
    end
    it 'returns true if the block never returns false or nil' do
      expect([1].my_all?(Integer)).to eql(true)
    end
    it 'returns true if the block never returns false or nil' do
      expect(%w[a ,b].all?(/\w/)).to eql(true)
    end
    it 'returns true if the block never returns false or nil' do
      expect(%w[a ,b].my_all?(/\w/)).to eql(true)
    end
    it 'returns true if the block never returns false or nil' do
      expect(%w[a ,b].my_all?(/\w/)).to eql(true)
    end
    it 'returns true if the block never returns false or nil' do
      expect([1].all?(1)).to eql(true)
    end
    it 'returns true if the block never returns false or nil' do
      expect([1].my_all?(1)).to eql(true)
    end
    it 'returns true if the block never returns false or nil' do
      expect(%w[ant bear cat].all? { |word| word.length >= 3 }).to eql(true)
    end
    it 'returns true if the block never returns false or nil' do
      expect(%w[ant bear cat].my_all? { |word| word.length >= 3 }).to eql(true)
    end
  end

  describe '#my_any' do
    it 'returns true if the block ever returns a value other than false or nil' do
      expect(%w[ant bear cat].any? { |word| word.length >= 3 }).to eql(true)
    end
    it 'returns true if the block ever returns a value other than false or nil' do
      expect(%w[ant bear cat].any? { |word| word.length >= 4 }).to eql(true)
    end
    it 'returns true if the block ever returns a value other than false or nil' do
      expect(%w[ant bear cat].any?(/d/)).to eql(false)
    end
    it 'returns true if the block ever returns a value other than false or nil' do
      expect([nil, true, 99].any?(Integer)).to eql(true)
    end
    it 'returns true if the block ever returns a value other than false or nil' do
      expect([nil, true, 99].any?).to eql(true)
    end
    it 'returns true if the block ever returns a value other than false or nil' do
      expect([].any?).to eql(false)
    end
  end

  describe 'my_none'
  it 'returns true if the block never returns true for all elements' do
    expect(%w[ant bear cat].none? { |word| word.length == 5 }).to eql(true)
  end
  it 'returns true if the block never returns true for all elements' do
    expect(%w[ant bear cat].none? { |word| word.length >= 4 }).to eql(false)
  end
  it 'returns true if the block never returns true for all elements' do
    expect(%w[ant bear cat].none?(/d/)).to eql(true)
  end
  it 'returns true if the block never returns true for all elements' do
    expect([1, 3.14, 42].none?(Float)).to eql(false)
  end
  it 'returns true if the block never returns true for all elements' do
    expect([].none?).to eql(true)
  end
  it 'returns true if the block never returns true for all elements' do
    expect([nil].none?).to eql(true)
  end
  it 'returns true if the block never returns true for all elements' do
    expect([nil, false].none?).to eql(true)
  end
  it 'returns true if the block never returns true for all elements' do
    expect([nil, false, true].none?).to eql(false)
  end
end

describe 'my_count' do
  it 'If a block is given, it counts the number of elements yielding a true value.' do
    expect([1, 2, 3, 4, 5].count).to eql(5)
  end
  it 'If a block is given, it counts the number of elements yielding a true value.' do
    expect([1, 2, 3, 4, 5, 2].count(2)).to eql(2)
  end
  it 'If a block is given, it counts the number of elements yielding a true value.' do
    expect([1, 2, 3, 4, 5, 2].count(&:even?)).to eql(3)
  end
end

describe 'my_map' do
  it 'returns a new array with the results of running block ' do
    expect([1, 2, 3, 4, 5].map { |i| i * i }).to eql([1, 4, 9, 16, 25])
  end
  it 'returns a new array with the results of running' do
    expect((1..4).collect { 'cat' }).to eql(%w[cat cat cat cat])
  end
end

describe 'my_inject' do
  it 'Sum some numbers when using a block and inject' do
    expect((5..10).inject { |sum, n| sum + n }).to eql(45)
  end
  it 'Sum some numbers' do
    expect((5..10).reduce(:+)).to eql(45)
  end
  it 'Multiply some numbers' do
    expect((5..10).reduce(1, :*)).to eql(151_200)
  end
  it 'Multiply some numbers when using a block' do
    expect((5..10).inject(1) { |product, n| product * n }).to eql(151_200)
  end
end
