require 'minitest/autorun'
require_relative 'b'

class TestBTask < Minitest::Test
  def setup
    @b_task = BTask.new(8, [3, 5, 3, 4, 8, 1, 0, 0], [
      [1, 4, 4, 8, 8, 4, 4, 8],
      [0, 1, 8, 0, 4, 7, 4, 2],
      [7, 1, 1, 5, 7, 4, 0, 2],
      [0, 2, 1, 1, 8, 8, 7, 2],
      [4, 0, 1, 5, 1, 2, 8, 5],
      [4, 1, 1, 7, 6, 1, 9, 9],
      [6, 6, 6, 9, 1, 9, 1, 8],
      [3, 3, 7, 6, 4, 1, 4, 1]
    ])
  end

  def test_calc
    p = @b_task.product
    assert_equal p, [75, 90, 87, 164, 312, 36, 0, 0]
  end
end