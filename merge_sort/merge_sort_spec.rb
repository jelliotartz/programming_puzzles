require_relative 'merge_sort'

describe '#merge_sort' do
  let(:array) { (1..100).to_a }
  let(:shuffled) { array.shuffle }

  it 'sorts the array' do
    expect(merge_sort(shuffled)).to eq array
  end
end

describe '#merge' do
  let(:array_1) { [1, 2, 3]}
  let(:array_2) { [4, 5, 6]}
  let(:array_3) { [100, 5, 6]}
  let(:array_4) { Array.new }

  it 'merges arrays' do
    expect(merge(array_1, array_2)).to eq [1,2,3,4,5,6]
  end

  it 'doesn\'t handle unsorted arrays' do
    expect(merge(array_1, array_3)).to eq [1,2,3,100,5,6]
  end

  it 'correctly handles empty arrays' do
    expect(merge(array_1, array_4)).to eq [1,2,3]
    expect(merge(array_4, array_2)).to eq [4,5,6]
  end
end