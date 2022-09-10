# variant 10

require_relative './t1-parser'

def sumPart(i1, i2)
  p1, p2 = [POINTS[i1], POINTS[i2]]
  xs = p1[:x] + p2[:x]
  yd = p1[:y] - p2[:y]
  (xs*yd)
end

last_index = POINTS.length - 1
area = (0...last_index)
         .map { |i| sumPart(i, i + 1) }
         .push(sumPart(last_index, 0))
         .sum.abs.to_f / 2

puts area