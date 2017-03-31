# Given 2 arrays, return the elements that are present in both arrays - assume arrays ARE sorted

# ruby's .sort method has O(n log n) runtime in worst case. best/most cases = O(n). uses timsort.
# in this challenge, we assume that if arrays were NOT sorted, we would immediatey call .sort on both, with O(n) complexity added to total runtime.


# worst case scenario
  # iterate over array_1
  # for each value, iterate over array 2 and return that value if/when found
  # runtime = O(n^2)

def find_duplicates_worst_case(array_1, array_2)
  array_1.select do |element|
    array_2.any? do |value|
      element == value
    end
  end
end

# driver code
# p find_duplicates_worst_case(array_1, array_2)


# compare values as you search to maximize efficiency
# sorting both arrays => O(n log n). always worth it.

def find_duplicates_efficient(array_1, array_2)
  result = []
  i = 0
  j = 0
  # when iterating over both arrays:
  while i < array_1.length && j < array_2.length
  # if equal
    if array_1[i] == array_2[j]
      # put in results container
      result << array_1[i]
      # increment both
      i += 1
      j += 1
  # is array_1.value < array_2.value?
    elsif array_1[i] < array_2[j]
    # yes:
      # every greater value in array_2 doesn't need to be checked.
      # increment array_1, repeat check
      i += 1
    else
    # no:
      # increment array_2, repeat check
      j += 1
    end
  end
  result
end

# driver code
# find_duplicates_efficient(array_1, array_2)


# what if array lengths very far from equal?
  # implement binary search on large array to maximize search efficiency
  # array_1 = [10,480,2000,10846]
  # array_2 = (1..10000).to_a

def find_duplicates_binary(array_1, array_2)
  return find_duplicates_binary(array_2, array_1) if array_1.length > array_2.length

  array_1.select do |element|
    binary_search(element, array_2)
  end

  # same result using ruby's built-in bsearch method
  # array_1.select do |element_1|
  #   result = array_2.bsearch do |element_2|
  #     element_2 >= element_1
  #   end
  # result == element_1
  # end

end


def binary_search(element, array)
  first_index = 0
  last_index = array.length - 1
  while first_index < last_index
    middle_index = (last_index - first_index) / 2 + first_index
    if element == array[middle_index]
      return true
    elsif element < array[middle_index]
      last_index = middle_index - 1
    else
      first_index = middle_index + 1
    end
  end
  element == array[first_index]
end

# driver code
# p find_duplicates_binary(array_1, array_2)

