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
  if a.nil? or b.nil? or c.nil?
    raise TriangleError, "It can't be a triangle if it doesn't have three sides that actually exist."
  end

  if a <= 0 || b <= 0 || c <= 0
    raise TriangleError, "The length of each triangle's side must be a natural number."
  end

  # Use a FP number so we don't accidentally round down to 0.
  s = (a + b + c) / 2.0
  # I totally forgot this property of triangles.
  ok = ((s - a) * (s - b) * (s - c)) > 0
  if !ok
    raise TriangleError, "You violated that rule that I forgot."
  end

  if a == b && b == c
    return :equilateral
  elsif a == b || a == c || b == c
    return :isosceles
  else
    return :scalene
  end
end



# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
