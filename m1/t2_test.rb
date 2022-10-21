require 'minitest/autorun'
require_relative 't2'

class TestTask2 < Minitest::Test
  def setup
    @trains = [
      Train.new(
        "Porto",
        1,
        [10, 15],
        [0, 0, 0, 0]
      ),
      Train.new(
        "Dublin",
        2,
        [15, 40],
        [0, 0, 0, 0]
      ),
      Train.new(
        "Warsaw",
        3,
        [5, 10],
        [6, 0, 0, 0]
      )
    ]
  end

  def get_numbers(arr)
    arr.map { |x| x.getNumber }
  end

  def test_a
    a = Train.filter_a(@trains, "Porto")
    n = get_numbers(a)
    assert_equal(n, [1])
  end

  def test_b
    b = Train.filter_b(@trains, "Dublin", 10)
    n = get_numbers(b)
    assert_equal(n, [2])

    b2 = Train.filter_b(@trains, "Dublin", 18)
    n2 = get_numbers(b2)
    assert_equal(n2, [])
  end

  def test_c
    c = Train.filter_c(@trains, "Warsaw")
    n = get_numbers(c)
    assert_equal(n, [3])
  end
end