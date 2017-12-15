require 'minitest/autorun'

require 'advent_of_code'

class Test20171208 < Minitest::Test
  def test_parse
    s = 'b inc 5 if a > 1
a inc 1 if b < 5
c dec -10 if a >= 1
c inc -20 if c == 10'

    c = December8.new(s)

    assert_equal 3, c.registers.length
    assert_equal 1, c.max_value
    assert_equal 10, c.highest_value
  end
end
