require 'minitest/autorun'
require_relative 'a'

class TestATask < Minitest::Test
  def setup
    @a_task = ATask.new([8, 9, 14, 23, 20, 10, 24, 3, 3, 10, 28, 2], [3, 29, 6, 6, 16, 5, 18, 8, 17, 25, 2, 14])
  end

  def test_calc
    c = @a_task.calc
    assert_equal c, [6, 6, 16, 18, 8, 2, 14, 3, 29, 5, 17, 25, 9, 23, 3, 3, 8, 14, 20, 10, 24, 10, 28, 2]
  end
end