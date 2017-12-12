require "minitest/autorun"

require 'advent_of_code';

class Test20171201 < Minitest::Test
  def test_sums
    assert_equal 3, December1.sum_matching('1122')
    assert_equal 4, December1.sum_matching('1111')
    assert_equal 0, December1.sum_matching('1234')
    assert_equal 9, December1.sum_matching('91212129')
  end

  def test_sums2
    assert_equal 6, December1.sum_matching_2('1212')
    assert_equal 0, December1.sum_matching_2('1221')
    assert_equal 12, December1.sum_matching_2('123123')
    assert_equal 4, December1.sum_matching_2('12131415')
  end
end