require 'minitest/autorun'
require_relative 't1'

class TestTask1 < Minitest::Test
  def test_tabulate1
    table = Task1.tabulate(1, 2, 3, 4, 10, 2)
    assert_equal(table, [[4, 1], [6, 2], [8, 2], [10, 3]])
  end

  def test_tabulate2
    table = Task1.tabulate(1.5, 2.3, 4.9, 1.0, 3.0, 0.8)
    cmp = [[1.0, 4.1], [1.8, 5.62], [2.6, 9.06]]
    delta = 0.01

    table.each_with_index do |row, i|
      row.each_with_index do |el, j|
        assert_in_delta(el, cmp[i][j], delta)
      end
    end
  end
end