# 10

class BTask
  def self.gen_row(n)
    Array.new(n) { rand(10) }
  end

  def self.gen_matrix(n)
    Array.new(n) do |x|
      r = gen_row(n)
      r[x] = 1
      r
    end
  end

  def self.print_matrix(m)
    m.each do |r|
      print "#{r}\n"
    end
  end

  def initialize(n, y, b)
    @n = n
    @y = y
    @b = b
  end

  def display_input
    print "y:\n#{@y}\n"
    print "b:\n"
    BTask.print_matrix @b
  end

  def product
    Array.new(@n) do |i|
      Array.new(@n) do |k|
        @y[i] * @b[k][i]
      end.sum
    end
  end
end

if $PROGRAM_NAME == __FILE__
  n = 8
  y = BTask.gen_row(n)
  b = BTask.gen_matrix(n)
  b_task = BTask.new(n, y, b)
  b_task.display_input
  p = b_task.product
  print "p:\n"
  print p
end
