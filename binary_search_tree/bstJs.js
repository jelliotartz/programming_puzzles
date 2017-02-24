var _ = require('underscore')

// Build a binary search tree from an array of numbers.
var buildTree = function(array) {
  // Take the first value from the shuffled array, make that the root of the tree.
  var tree = {key: array[0]}
  // Iterate through the rest of the array.
  for (i = 1; i < array.length; i++) {
    // Create a variable that represents the current state of the tree each time as we iterate through the array.
    var node = tree
    // Create a variable that represents the number in the array.
    var number = array[i]
    // Create a variable that enables me to get out of the while loop once number is inserted at the correct location on the tree.
    var searching = true
    while (searching) {
      // Is number smaller than this node?
      if (number < node.key) {
        // Does this node has a smaller child?
        if (node.left) {
          // If yes, set this node to that smaller child.
          node = node.left
          // Searching is still true, so we return to if (number < node.key)
        } else {
          // Otherwise, this node doesn't have a smaller child.
          // Create a smaller child for this node, with number as its key.
          node.left = {key: number}
          // Break the while loop, and move on to the next number.
          searching = false
        }
      // The number must be larger than this node.
      } else {
        // Does this node have a larger child?
        if (node.right) {
          // If the node has a larger child, set node to that node.
          node = node.right
          // Searching is still true, so we return to if (number < node.key)
        } else {
          // Otherwise, this node doesn't have a larger child.
          // Create a larger child for this node, with number as its key.
          node.right = {key: number}
          // Break the while loop, and move on to the next number.
          searching = false
        }
      }
    }
  }
  // After every number in the array has been iterated over
    // and added at the correct position on the tree,
    // the ordered binary tree is built. Return it.
  return tree
}

/* Assume that an ordered binary search tree has already been created.
 *
 * Write a function that traverses the tree and finds
 * the largest value that is smaller than a specific value in the tree.
 */

var largestSmallerValue = function(root, x) {
  // Create a variable that will store our result.
  var result = null
  // Create a condition that will break when we get to the bottom of the tree (i.e., a leaf).
  // We can accomplish this by looking for a leaf's child, which is undefined.
  // Setting root to undefined breaks the while loop.
  while (root) {
    // Is x less than this node?
    if (root.key < x) {
      // Store this value as result.
      result = root.key
      // Does this node have a larger child? If so, go to it. If not, we're at a leaf.
      root = root.right
    } else {
      // x is greater than this node, so we don't want to store this value.
      // Does this node have a smaller child? If so, go to it. If not, we're at a leaf.
      root = root.left
    }
  }
  // We've stored the correct result, and reached a leaf, thus breaking the while loop. Return result.
  return result
}

// Driver code
var array = _.shuffle([89, 2, 17, 7, 35, 19, 3, 21, 4])
var tree = buildTree(array)

console.log(largestSmallerValue(tree, 7))
