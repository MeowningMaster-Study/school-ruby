# 10

class Task1
  def self.integrate_rectangular(a, b, n, f)
    if a > b
      a, b = b, a
    end
    h = (b - a) / n
    s = 0.0
    (1...n).each { |i|
      xi = a + i*h - h/2
      s += f.call(xi)
    }
    h * s
  end

  def self.integrate_trapezoidal(a, b, n, f)
    if a > b
      a, b = b, a
    end
    h = (b - a) / n
    s = f.call(a)/2 + f.call(b)/2
    i = a + h
    while i < b
      s += f.call(i)
      i += h
    end
    h * s
  end
end

if $PROGRAM_NAME == __FILE__
  f1 = Proc.new{ |x| 2.0 / (1.0 - 4.0*x) }
  f2 = Proc.new do |x|
    Math.asin(Math.sqrt(x)) /
      Math.sqrt(x * (1.0 - x))
  end
  f3 = Proc.new { |x| 1.0 / (x+1.0)*Math.sqrt(x**2 + 1.0)}

  a1, b1 = 2.2, -1.2
  a2, b2 = 0.2, 0.3
  a3, b3 = 0.0, 0.6

  n = 100000

  r1r, r1t =
    Task1::integrate_rectangular(a1, b1, n, f1),
    Task1::integrate_trapezoidal(a1, b1, n, f1)
  printf("f1\nrectangular: %f\ntrapezoidal: %f\n", r1r, r1t)

  r2r, r2t =
    Task1::integrate_rectangular(a2, b2, n, f2),
      Task1::integrate_trapezoidal(a2, b2, n, f2)
  printf("f2\nrectangular: %f\ntrapezoidal: %f\n", r2r, r2t)

  r3r, r3t =
    Task1::integrate_rectangular(a3, b3, n, f3),
      Task1::integrate_trapezoidal(a3, b3, n, f3)
  printf("f3\nrectangular: %f\ntrapezoidal: %f\n", r3r, r3t)
end
