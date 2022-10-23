require 'minitest/autorun'
require_relative 'main'

class Test < Minitest::Test
  def setup
    super
    @arr = [
      Student.new("N_A", "S_A", "P_A", "M", 20, 3),
      Student.new("N_A", "S_C", "P_A", "M", 20, 3),
      Student.new("N_B", "S_F", "P_A", "M", 19, 2),
      Student.new("N_B", "S_B", "P_A", "F", 20, 3),
      Student.new("N_B", "S_D", "P_A", "F", 18, 1),
      Student.new("N_C", "S_B", "P_A", "F", 20, 2),
    ]
  end

  def test_1
    r = Student::t1(@arr)
    assert_equal(r, 3)
  end

  def test_2
    r = Student::t2(@arr)
    assert_equal(r, %w[N_A N_B])
  end

  def test_3
    r = Student::t3(@arr)
    assert_equal(r, %w[S_A S_B S_B S_C S_D S_F])
  end

  def test_4
    r = Student::t4(@arr)
    assert_equal(r, ["S_B N. P.", "S_B N. P."])
  end
end
