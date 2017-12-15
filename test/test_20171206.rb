require 'minitest/autorun'

require 'advent_of_code'

class Test20171206 < Minitest::Test
  def test_parse
    s = '0  2 7 0'

    c = December6.new(s)

    assert_equal [0, 2, 7, 0], c.banks
  end

  def test_redistribute
    s = '0  2 7 0'

    c = December6.new(s)

    assert_equal [0, 2, 7, 0], c.banks
    assert_equal 0, c.redistribute
    assert_equal [2, 4, 1, 2], c.banks
    assert_equal 0, c.redistribute
    assert_equal [3, 1, 2, 3], c.banks
    assert_equal 0, c.redistribute
    assert_equal [0, 2, 3, 4], c.banks
    assert_equal 0, c.redistribute
    assert_equal [1, 3, 4, 1], c.banks
    assert_equal 4, c.redistribute
    assert_equal [2, 4, 1, 2], c.banks
  end
end
