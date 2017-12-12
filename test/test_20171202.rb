require 'minitest/autorun'

require 'advent_of_code'

class Test20171202 < Minitest::Test
  def test_parse_line
    assert_equal [1, 2, 3], December2.parse_line('1	2	3')
    assert_equal [11, 22, 33], December2.parse_line('11	22	33')
  end

  def test_parse_ss
    ss = '1	2	3
1	2	3
1	2	3'

    assert_equal [[1, 2, 3], [1, 2, 3], [1, 2, 3]], December2.parse_spreadsheet(ss)

    ss = '1	2	3
  1	2
  1	2	3'

    assert_equal [[1, 2, 3], [1, 2], [1, 2, 3]], December2.parse_spreadsheet(ss)
  end

  def test_checksum
    ss = '5	1	9	5
7	5	3
2	4	6	8'

    assert_equal 18, December2.checksum(ss)
  end

  def test_checksum2
    ss = '5 9 2 8
9 4 7 3
3 8 6 5'

    assert_equal 9, December2.checksum2(ss)
  end
end
