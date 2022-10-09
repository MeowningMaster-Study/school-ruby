class CTask
  def initialize(n, k)
    @n = n
    @a = Array.new(n) do |x|
      r = Array.new(n + 1) { k + 2 }
      r[x] = 2
      r[n] = x
      r
    end
  end

  def self.print_matrix(m)
    m.each do |r|
      print "#{r}\n"
    end
  end

  def display_input
    print "a:\n"
    CTask.print_matrix(@a)
  end

  def solve
    (@n - 1).times do |k|
      (k + 1).upto(@n - 1) do |i|
        d = @a[i][k] / @a[k][k].to_f
        (k + 1).upto(@n) do |j|
          @a[i][j] -= @a[k][j] * d
        end
      end
    end

    (@n - 1).downto(0) do |i|
      d = @a[i][@n]
      (i + 1).upto(@n - 1) do |j|
        d -= @a[i][j] * @a[j][@n]
      end
      @a[i][@n] = d / @a[i][i].to_f
    end

    Array.new(@n) {|k| @a[k][@n]}
  end
end

if $PROGRAM_NAME == __FILE__
  print "n: "
  n = gets.chop.to_i
  if n < 3 || n > 9
    raise "incorrect n"
  end
  k = 5
  c_task = CTask.new(n, k)
  c_task.display_input
  r = c_task.solve
  puts "#{r}"
end