require 'minitest/autorun'
require_relative 't1'

class TestTask1 < Minitest::Test
  def test_10_1
    f = Proc.new{ |x| 2.0 / (1.0 - 4.0*x) }
    a, b = 2.2, -1.2
    n = 100000
    correct = 0.148133
    delta = 0.001


    rr, rt =
      Task1::integrate_rectangular(a, b, n, f),
        Task1::integrate_trapezoidal(a, b, n, f)
    assert_in_delta(rr, correct, delta)
    assert_in_delta(rt, correct, delta)
  end

  def test_10_2
    f = Proc.new do |x|
      Math.asin(Math.sqrt(x)) /
        Math.sqrt(x * (1.0 - x))
    end
    a, b = 0.2, 0.3
    n = 100000
    correct = 0.121013
    delta = 0.001


    rr, rt =
      Task1::integrate_rectangular(a, b, n, f),
        Task1::integrate_trapezoidal(a, b, n, f)
    assert_in_delta(rr, correct, delta)
    assert_in_delta(rt, correct, delta)
  end

  def test_11_1
    f = Proc.new { |x| 1.0 / (x+1.0)*Math.sqrt(x**2 + 1.0)}
    a, b = 0.0, 0.6
    n = 100000
    correct = 0.493846
    delta = 0.001


    rr, rt =
      Task1::integrate_rectangular(a, b, n, f),
        Task1::integrate_trapezoidal(a, b, n, f)
    assert_in_delta(rr, correct, delta)
    assert_in_delta(rt, correct, delta)
  end
end