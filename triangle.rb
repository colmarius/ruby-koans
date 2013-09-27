# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  raise TriangleError, "Side are not valid." unless valid_triangle?(a, b, c)

  if (a == b && a == c)
    return :equilateral
  elsif a == b || a == c || b == c
    return :isosceles
  else
    return :scalene
  end
end

def valid_triangle?(a, b, c)
  valid = true
  sides = [a, b, c]

  (0..2).each do |i|
    valid = false if sides[i] <= 0
    valid = false if (sides[0] + sides[1] <= sides[2])
    sides << sides.shift
  end
  valid
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
