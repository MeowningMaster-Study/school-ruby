# 10
require 'ostruct'

class ATask
  def self.generate
    r = OpenStruct.new
    r.a = Array.new(12) { rand(1...30) }
    r.b = Array.new(12) { rand(1...30) }
    r
  end

  def initialize(a, b)
    @a = a
    @b = b
  end

  def display_input
    print("#{@a}\n")
    print("#{@b}\n")
  end

  def calc
    @c = []

    @b.each do |x|
      unless x.odd?
        @c.push(x)
      end
    end

    @b.each do |x|
      if x.odd?
        @c.push(x)
      end
    end

    @a.each do |x|
      if x.odd?
        @c.push(x)
      end
    end

    @a.each do |x|
      unless x.odd?
        @c.push(x)
      end
    end

    @c
  end
end

if $PROGRAM_NAME == __FILE__
  r = ATask.generate
  t = ATask.new(r.a, r.b)
  t.display_input
  c = t.calc
  print "#{c}\n"
end
