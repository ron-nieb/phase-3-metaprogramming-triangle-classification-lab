class Triangle

  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    validate_triangle

    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side1 == side3 || side2 == side3
      :isosceles
    else
      :scalene
    end
  end
  
  class TriangleError < StandardError
  end

  def validate_triangle
    validate_positive_sides
    validate_triangle_inequality
  end

  def validate_positive_sides
    sides = [side1, side2, side3]
    if sides.any? { |side| side <= 0 }
      raise TriangleError, "Triangle sides must be greater than zero."
    end
  end

  def validate_triangle_inequality
    if side1 + side2 <= side3 || side1 + side3 <= side2 || side2 + side3 <= side1
      raise TriangleError, "Triangle inequality violation."
    end
  end
end

