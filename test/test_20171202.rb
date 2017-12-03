require "minitest/autorun"

require 'AdventOfCode';

class Test20171202 < Minitest::Test
  def test_parse_line
	assert_equal [1, 2, 3], December2.parseLine('1	2	3')
	assert_equal [11, 22, 33], December2.parseLine('11	22	33')
  end

  def test_parse_ss
  	ss = '1	2	3
1	2	3
1	2	3'

	assert_equal [[1, 2, 3], [1, 2, 3], [1, 2, 3]], December2.parseSpreadsheet(ss)

	ss = '1	2	3
1	2
1	2	3'

	assert_equal [[1, 2, 3], [1, 2], [1, 2, 3]], December2.parseSpreadsheet(ss)
  end    

  def test_checksum
  	ss = '5	1	9	5
7	5	3
2	4	6	8'

    assert_equal 18, December2.checksum(ss)
    
  end
end