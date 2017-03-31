require_relative 'find_duplicates'

describe '#find_duplicates_worst_case' do
  let(:array_1) { [1,2,3,4,5,6] }
  let(:array_2) { [4,5,6,7,8,9] }
  let(:array_3) { [10,11,12] }

  it 'returns duplicate elements from 2 arrays' do
    expect(find_duplicates_worst_case(array_1, array_2)).to match_array([4,5,6])
  end

  it 'returns an empty array if there are no duplicates' do
    expect(find_duplicates_worst_case(array_1, array_3)).to be_empty
  end

end

describe '#find_duplicates_efficient' do
  let(:array_1) { [1,2,3,4,5,6] }
  let(:array_2) { [4,5,6,7,8,9] }
  let(:array_3) { [10,11,12] }

  it 'returns duplicate elements from 2 arrays' do
    expect(find_duplicates_efficient(array_1, array_2)).to match_array([4,5,6])
  end

  it 'returns an empty array if there are no duplicates' do
    expect(find_duplicates_efficient(array_1, array_3)).to be_empty
  end
end

describe '#find_duplicates_binary' do
  let(:array_1) { [10,480,2000,10846] }
  let(:array_2) { (1..10000).to_a }

  it 'finds duplicates using binary search method' do
    expect(find_duplicates_binary(array_1, array_2)).to match_array([10,480,2000])
  end
end