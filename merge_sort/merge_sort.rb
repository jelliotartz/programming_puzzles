def merge_sort(array)
  # base case: array is sorted. it either has 1 element, or no elements.
  if array.length <= 1
    return array
  end

  # divide array into halves
  first_half = array[0..array.length/2 - 1]
  second_half = array[array.length/2..array.length]

  # call merge_sort on each half until you get individual elements
  sorted_first_half = merge_sort(first_half)
  sorted_second_half = merge_sort(second_half)

  #  call merge on pairs of elements, thereby merging them in sorted order
  merge(sorted_first_half, sorted_second_half)
end


def merge(a, b)
  # if a is empty, add element from b, and vice versa
  if a.length == 0
    return b
  elsif b.length == 0
    return a
  # compare a versus b. take smallest element, and call merge recursively on remaining elements.
  elsif a[0] < b[0]
    return [a.shift] + merge(a, b)
  else
    return [b.shift] + merge(a, b)
  end
end

# driver code
# array = [2,4,1,7,8,5,9,10,1]
# p merge_sort(array)