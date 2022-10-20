# variant 10

class Task1
  def self.func(a, b, c, x)
    if x < 3 && b != 0
      a*x*x - b*x + c
    elsif x > 3 && b == 0
      (x-a)/(x-c)
    else
      x/c
    end
  end

  def self.should_floor(a, b, c)
    ac, bc, cc  = a.floor, b.floor, c.floor
    (~(ac | bc) & (ac ^ cc)) == 0
  end

  def self.tabulate(a, b, c, xs, xf, xd)
    s_f = should_floor(a, b, c)
    t = Array.new

    xc = xs
    while xc <= xf
      r = func(a, b, c, xc)
      if s_f
        r = r.floor
      end
      t.push [xc, r]
      xc += xd
    end

    t
  end

  def self.print_table(t)
    t.each do |r|
      printf("%d %d\n", r[0], r[1])
    end
  end
end

if $PROGRAM_NAME == __FILE__
  a, b, c = gets.chop.split(" ").map(&:to_f)
  xs, xf, xd = gets.chop.split(" ").map(&:to_f)
  table = Task1.tabulate(a, b, c, xs, xf, xd)
  print table
  print "\n"
  Task1.print_table table
end