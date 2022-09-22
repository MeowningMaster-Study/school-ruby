n = rand(15)
c = rand(15)
PI = 3.141

puts "n = #{n}, c = #{c}"

def y(x, n, c)
  p1 = (n-c)**2 + 4*n*c
  p2 = n**2 - c**2
  p = x**(p1/p2)**1/n

  k1 = x/n + 12
  k2 = 6 - c*x
  k = k1 / k2

  p + k
end

def ctg(x)
  1 / Math.tan(x)
end

def z(x, n, c)
  p1 = (Math.sin(x)**2 + Math.tan(x)**2)**c + 1
  p2 = Math.cos(x)**2 - ctg(x)**2 + 1
  p = p1 * p2

  k1 = Math.cos(x)**2 + ctg(x)**2 + 1
  k2 = Math.sin(x)**2 + Math.tan(x)**2 - 1
  k = k1 * k2

  p / k
end

def tabulate(start, finish, segments_count)
  start = start.to_f
  finish = finish.to_f

  yield start
  if segments_count > 1
    p = start
    d = (finish - start) / segments_count
    (segments_count - 1).times {
      p += d
      yield p
    }
  end
  yield finish
end

# 1
puts "\n#1"
tabulate(1, n, n + c) { |x|
  r = y(x, n, c)
  print "#{r} "
}
puts

#2
puts "\n#2"
tabulate(PI / n, PI, (3/2)*n + c) { |x|
  r = z(x, n, c)
  print "#{r} "
}
puts

#3
puts "\n#3"

def trh(x, n, c)
  if 2 < x && x < n
    y(x, n, c)
  elsif n < x && x < 2*n
    z(x, n, c)
  else
    y(x, n, c) + z(x, n, c)
  end
end

tabulate(2, c, 2*n) { |x|
  r = trh(x, n, c)
  print "#{r} "
}
puts