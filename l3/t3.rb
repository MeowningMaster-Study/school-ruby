def two
  sum = 0.0
  three_pow = 1.0
  (0..8).each { |i|
    sum += 1.0 / three_pow
    three_pow *= 3.0
  }
  sum
end

def tree(x, n)
  sum = 0.0
  x_pow = 1.0
  f_step = 0.0
  factorial = 1.0
  (0..8).each { |i|
    sum += x_pow / factorial
    x_pow *= x
    f_step += 1.0
    factorial *= f_step
  }
  sum
end

puts two

x = 5.0
print "Input n: "
n = gets.chop.to_i
puts tree(x, n)