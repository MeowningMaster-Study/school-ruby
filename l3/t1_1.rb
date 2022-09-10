A, B, C = [true, false, false]
X, Y, Z = [50, 10, -5]

# boolean implication
def impl(a, b)
  a && !b ? false : true
end

a = !(A || B) && (A && !B)
puts "a) #{a}"

b = impl((Z != Y), (6 >= Y)) && A || B && C || X >= 1.5
puts "b) #{b}"

c = (8 - X*2 <= Z) && (X**2 >= Y**2) || (Z >= 15)
puts "c) #{c}"

d = X > 0 && Y < 0 || Z >= (X*Y - (-Y/X)) + (-Z)/2
puts "d) #{d}"

e = !(A || B && !(C || (!A || B)))
puts "e) #{e}"

f = (X**2 + Y**2) >= 1 && X >= 0 && Y >= 0
puts "f) #{f}"

g = (A && (C && B != B || A)) && B
puts "g) #{g}"
