=begin
We write the integers of A and B (in the order they are given) on two separate horizontal lines.

Now, we may draw a straight line connecting two numbers A[i] and B[j] as long as A[i] == B[j], and the line we draw does not intersect any other connecting (non-horizontal) line.

Return the maximum number of connecting lines we can draw in this way.

 

Example 1:

Input: A = [1,4,2], B = [1,2,4]
142
|/
124
Output: 2
Explanation: We can draw 2 uncrossed lines as in the diagram.
We cannot draw 3 uncrossed lines, because the line from A[1]=4 to B[2]=4 will intersect the line from A[2]=2 to B[1]=2.

Example 2:

Input: A = [2,5,1,2,5], B = [10,5,2,1,5,2]
Output: 3

Example 3:

Input: A = [1,3,7,1,7,5], B = [1,9,2,5,1]
Output: 2
=end


a = ARGV.first.split(',').map(&:to_i)
b = ARGV[1].split(',').map(&:to_i)

line_indices = []
# find all straight lines
a.each_with_index do |no, i|
  next unless a[i] == b[i]
  line_indices << i
end

b_start_index = 0
# find possible non-straight lines within straight line boundaries
a.each_with_index do |no, i|
  next if line_indices.include?(i)

  # find the boundary for current index
  b_start_index = i if b_start_index < i
  b_stop_index = line_indices.detect { |li| li > i } || b.length
  next if b_start_index >= b_stop_index

  (b_start_index...b_stop_index).to_a.each do |j|
    next unless a[i] == b[j]
    line_indices << i
    b_start_index = j
    break
  end
end

puts line_indices.inspect
puts line_indices.length
