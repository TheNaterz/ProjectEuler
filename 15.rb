=begin 

Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?

=end

# Creating a 21x21 grid of nodes. This would correspond to a 20x20 grid of squares.
node_grid = Array.new(21) { |col| Array.new(21) {0} }

# Looping through the right and bottom walls of the grid. If a path reaches any of these nodes
# then there is only one way to go, so these should all be 1.
y = 20
while y > -1
  node_grid[20][y] = 1
  node_grid[y][20] = 1
  y -= 1
end

# Now, starting on the top left node of the bottom right box (confusing, I know), we just count
# the node paths to the right and below the current node and use this number for this node.
i = 19
while i > -1
  j = 19
  while j > -1
    node_grid[i][j] = node_grid[i+1][j] + node_grid[i][j+1]
    j -= 1
  end
  i -= 1
end

# At the end, we have the number of paths for the the top left most node which is our answer.
# This grid also contains all paths starting from all nodes, but funny enough, this is the
# fastest solution :)
puts node_grid[0][0].to_s