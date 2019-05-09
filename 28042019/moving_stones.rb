=begin
Three stones are on a number line at positions a, b, and c.

Each turn, let's say the stones are currently at positions x, y, z with x < y < z.  You pick up the stone at either position x or position z, and move that stone to an integer position k, with x < k < z and k != y.

The game ends when you cannot make any more moves, ie. the stones are in consecutive positions.

When the game ends, what is the minimum and maximum number of moves that you could have made?  Return the answer as an length 2 array: answer = [minimum_moves, maximum_moves]

Example 1:

Input: a = 1, b = 2, c = 5
Output: [1, 2]
Explanation: Move stone from 5 to 4 then to 3, or we can move it directly to 3.

Example 2:

Input: a = 4, b = 3, c = 2
Output: [0, 0]
Explanation: We cannot make any moves.

=end

a, b, c = ARGV[0].split(',').map(&:to_i)

a, b, c = [a, b, c].sort
max_moves = min_moves = 0

if b - a > 1
  min_moves = max_moves = (b - a - 1)
end
if c - b > 1
  moves = (c - b - 1)
  max_moves += moves
  min_moves = (min_moves == 0 ? moves : [min_moves, moves].min)
end

res = [min_moves, max_moves]
puts res.inspect
