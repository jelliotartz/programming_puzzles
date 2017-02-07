## Given a 2D array, print all of its items in a spiral order, clockwise.
For example:

```ruby
two_d_array = [[1,2,3,4,5],
              [6,7,8,9,10],
              [11,12,13,14,15],
              [16,17,18,19,20]]
```

The clockwise spiral print is:  1 2 3 4 5 10 15 20 19 18 17 16 11 6 7 8 9 14 13 12

#### solution notes:
note use of Ruby's `downto` [method](https://ruby-doc.org/core-2.2.0/Integer.html#method-i-downto) for moving from higher to lower values in a range.

Runtime Complexity: iterating over n * m cells and printing them takes O(n*m).

Space Complexity: using a constant number of indices (4), therefore: O(1).