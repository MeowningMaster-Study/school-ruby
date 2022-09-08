# variant 10

print "Provide X: "
x = Float(gets.chop)

print "Provide T: "
t = Float(gets.chop)

print "Provide Z: "
z = Float(gets.chop)

p1 = Math.exp(Math.tan(x)**2)
p2_1 = Math.sqrt((t - z).abs)
p2_2 = Math.cos(Math::PI**2)**3 + Math.exp(Math::PI)*z**2
p2 = p2_1 / p2_2
p3 = 2.3*10**1.6
gamma = p1 + p2 + p3

puts "\nYour result is: #{gamma}"