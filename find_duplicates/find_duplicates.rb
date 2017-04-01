# Find Duplicates: Given 2 arrays, return the elements that are present in both arrays

# In this challenge, we assume both arrays ARE sorted.
# If the arrays were NOT sorted, we would immediatey call .sort on both, with O(n) complexity added to total runtime.
# Ruby's .sort method has O(n log n) runtime in worst case. best/most cases = O(n). Uses timsort.

# Worst case scenario
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

# Efficient solution: compare values as you search, and since arrays are sorted, intelligently determine whether to check values in both arrays
  # i.e., for every value, determine whether the target and search values are less than, greater than, or equal to each other.
  # move along the array values according to this logic, rather than blindly checking all values in both arrays.
  # runtime = O(n + m), where n and m are the lengths of the arrays. simplifies to O(n)

def find_duplicates_efficient(array_1, array_2)
  result = []
  # create counters
  i = 0
  j = 0
  # when iterating over both arrays:
  while i < array_1.length && j < array_2.length
  # if equal
    if array_1[i] == array_2[j]
      # put in results container
      result << array_1[i]
      # increment both counters, since we no longer need to check any values below the one we just identified as a duplicate.
      i += 1
      j += 1
  # is array_1.value less than array_2.value?
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

# what if array lengths are very far from equal? e.g., array_1 = [10,480,2000,10846] and array_2 = (1..10000).to_a
# solution: implement binary search on the large array to maximize search efficiency
# runtime = O(n log n)

def find_duplicates_binary(array_1, array_2)
  # assume that array_1 is the 'small array' and array_2 is the large array. But handle the reverse case
  return find_duplicates_binary(array_2, array_1) if array_1.length > array_2.length

  # select returns the elements of array_1 for which the given block (binary_search) returns true
  array_1.select do |element|
    # returns true when an element is found in array_2
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


# homemade binary search - assume array is sorted
def binary_search(element, array)
  first_index = 0
  last_index = array.length - 1
  while first_index < last_index
    # find the middle index of the array
    middle_index = (last_index - first_index) / 2 + first_index
    # return true when 'halving' the indices narrows the search to the array element that matches the target element
    return true if element == array[middle_index]
    # if the element is smaller than the middle number in the array, set last index to middle, and recalculate middle index.
    # and vice versa if element is larger than middle number.
    element < array[middle_index] ? last_index = middle_index - 1 : first_index = middle_index + 1
  end
  # return true when element matches only index left in array
  element == array[first_index]
end
