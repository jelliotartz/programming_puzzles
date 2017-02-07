two_d_array = [[1,2,3,4,5],
              [6,7,8,9,10],
              [11,12,13,14,15],
              [16,17,18,19,20]]

def spiral_print(array)
  top_row = 0 # index of the the uppermost row to be printed
  bottom_row = array.length - 1 # index of the the lowermost row to be printed
  right_col = array[0].length - 1 # index of the the rightmost row to be printed
  left_col = 0 # index of the leftmost column to be printed

  # find the end: at some point, either the left_col index will overtake right_col index, or bottom_row index will overtake top
  while(top_row <= bottom_row && left_col <= right_col)
    # print top_row values
    (top_row..right_col).each do |i|
      p array[top_row][i]
    end
    top_row += 1

    # print right_col values
    (top_row..bottom_row).each do |i|
      p array[i][right_col]
    end
    right_col -= 1

    # check that top_row is still <= bottom_row, then print bottom_row values
    if top_row <= bottom_row
      right_col.downto(left_col).each do |i|
        p array[bottom_row][i]
      end
      bottom_row -= 1
    end

    # check that left_col is still <= right_col, then print left_col values
    if left_col <= right_col
      bottom_row.downto(top_row).each do |i|
        p array[i][left_col]
      end
      left_col += 1
    end
  end
end

spiral_print(two_d_array)
