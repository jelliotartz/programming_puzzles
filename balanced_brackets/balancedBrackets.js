
/* Balanced Brackets
 *
 * A bracket is considered to be any one of the following characters: (, ), {, }, [, or ].
 *
 * Two brackets are considered to be a matched pair if the an opening bracket (i.e., (, [, or {)
 * occurs to the left of a closing bracket (i.e., ), ], or }) of the exact same type.
 * There are three types of matched pairs of brackets: [], {}, and ().
 *
 * A matching pair of brackets is not balanced if the set of brackets it encloses are not matched.
 * For example, {[(])} is not balanced because the contents in between { and } are not balanced.
 * The pair of square brackets encloses a single, unbalanced opening bracket, (,
 * and the pair of parentheses encloses a single, unbalanced closing square bracket, ].
 *
 * By this logic, we say a sequence of brackets is considered to be balanced if the following conditions are met:
 *  It contains no unmatched brackets.
 *  The subset of brackets enclosed within the confines of a matched pair of brackets is also a matched pair of brackets.
 *
 * Given strings of brackets, determine whether each sequence of brackets is balanced.
 * If a string is balanced, print YES on a new line; otherwise, print NO on a new line.
 *
 * Input Format:
 *  The first line contains a single integer, , denoting the number of strings.
 *  Each line  of the  subsequent lines consists of a single string, , denoting a sequence of brackets.
 *
 * Constraints
 *  1 <= n <= 10^3
 *  1 <= sequence.length <= 10^3
 *  Each character in the sequence will be a bracket (i.e., {, }, (, ), [, and ]).
 *
 * Output Format
 *  For each string, print whether or not the string of brackets is balanced on a new line.
 *  If the brackets are balanced, print YES; otherwise, print NO.
 *
 */

 // Pseudocode

 // Steps
   // create some reference structures to store the target characters (openers and closers)
   // create stack object - array

   // iterate over input string
     // is char an opener?
       // if yes, add to stack
       // if no
         // compare the type of bracket with the most recently added element on the stack
           // if it matches and hence 'closes' the most recently added element on the stack
             // remove that element from the stack (stack.pop)
           // else - it doesn't match, and we have an unbalanced bracket input string
             // return NO


function balacedBracket(input) {
  let stack = [] // "the stack" will be represented as an array
  const openers = ["{", "[", "("] // opening brackets
  const closers = ["}", "]", ")"] // closing brackets, with corresponding indices

  // Iterate over each character in the input string
  for (let i = 0; i < input.length; i++) {
    // If the character is an opening bracket, add it to the stack
    if (openers.includes(input[i])) {
      stack.push(input[i])
      // If the character is a closing bracket, we need to check if it closes the most recently added opening bracket
    } else if (closers.includes(input[i])) {
      // Compare the type of bracket with the most recently added element on the stack
      if (closers.indexOf(input[i]) === openers.indexOf(stack[stack.length - 1])) {
        // If it matches and hence 'closes' the most recently added element on the stack, remove the last element from the stack
        stack.pop()
      } else {
        // It doesn't match, and we have an unbalanced bracket input string
        console.log("NO")
        return 0
      }
    }
  }
  // If we iterate through the entire input string and successfully open and close all bracket pairs,
    // the input is balanced, so return yes.
  console.log("YES")
}


// Driver code
const input = "{{[[(())]]}}"

balacedBracket(input)

/* Reflections on stack data structures
 *
 * This exercise is helpful for visualizing and understanding how a stack data structure operates.
 * The LIFO (last in first out) check to see if brackets match illustrates how a stack organizes and holds data.
 * js push() and pop() methods mimic the LIFO data storage and retrieval methods of a stack
 *
 */
