require 'minitest/autorun'
require_relative 'c'

class TestCTask < Minitest::Test
  def setup
    @c_task = CTask.new(4, 5)
  end

  def test_solve
    roots = @c_task.solve
    cmp_roots = [0.36522, 0.16522, -0.034783, -0.23478]
    delta = 0.01
    roots.each_with_index do |r, i|
      assert_in_delta r, cmp_roots[i], delta
    end
  end
end