EPS = 0.00001

def fac(n)
  n > 1 ? n * fac(n - 1) : 1
end

def one
  sum = 0.0
  n = 2.0
  loop do
    a = n * (n + 1.0)
    step = a ** -a
    sum += step
    if (step).abs < EPS
      break
    end
    n += 1
  end
  sum
end

puts "1) #{one}"

def two(x)
  sum = 1.0/x
  n = 1.0
  loop do
    a = 2.0*(-1.0)**n*(2.0**(2.0*n)-1.0)
    b = fac(2*n).to_f
    c = n**(6.0/7.0)*x**(2.0*n-1.0)
    step = a / b * c
    sum += step
    if (step).abs < EPS
      break
    end
    n += 1
  end
  sum
end

def two_built_in(x)
  2 / (Math.exp(x) - Math.exp(-x))
end

puts
puts "2) #{two(6)}"
puts "2) built-in #{two_built_in(6)}"

def three
  sum = 0.0
  n = 1.0
  loop do
    a = fac(3.0 * n - 2.0) * fac(2.0 * n - 1.0)
    b = fac(4.0 * n) * 5**(2*n) * fac(2*n)
    step = a / b
    sum += step
    if (step).abs < EPS
      break
    end
    n += 1
  end
  sum
end

puts
puts "3) #{three}"