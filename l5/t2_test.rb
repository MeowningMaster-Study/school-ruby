require 'minitest/autorun'
require_relative 't2'

class TestTask2 < Minitest::Test
  def test_
    f = Proc.new do |i, x|
      p = (2.0 * i - 1.0)**2
      Math.cos(2.0*i - 1.0) * x / p
    end
    x = 0.6
    n = 30
    correct = 0.593268
    delta = 0.001

    r = Task2::sum(0, x, n, f)
    assert_in_delta(r, correct, delta)
  end
end