require "minitest/autorun"

require 'AdventOfCode';

class Test20171201 < Minitest::Test
  def test_sums
    assert_equal 3, December1.sumMatching('1122')
    assert_equal 4, December1.sumMatching('1111')
    assert_equal 0, December1.sumMatching('1234')
    assert_equal 9, December1.sumMatching('91212129')
  end
end