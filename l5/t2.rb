# variant 10

class Task2
  def self.sum(i0, x, n, f)
    s = 0.0
    (i0...n).each { |i| s += f.call(i, x) }
    s
  end
end

if $PROGRAM_NAME == __FILE__
  f = Proc.new do |i, x|
    p = (2.0 * i - 1.0)**2
    Math.cos(2.0*i - 1.0) * x / p
  end

  x = 0.1
  n = 30
  while x <= 1.0
    r = Task2::sum(0, x, n, f)
    printf("%f: %f\n", x, r)
    x += 0.1
  end

end