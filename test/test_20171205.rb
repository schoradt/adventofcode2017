require 'minitest/autorun'

require 'advent_of_code'

class Test20171205 < Minitest::Test
  def test_parse
    s = '0
3
0
1
-3'

    c = December5.new(s)

    assert_equal [0, 3, 0, 1, -3], c.jumps
  end

  def test_process
    s = '0
3
0
1
-3'

    c = December5.new(s)

    assert_equal [0, 3, 0, 1, -3], c.jumps
    assert_equal 0, c.process(0)
    assert_equal [1, 3, 0, 1, -3], c.jumps
    assert_equal 1, c.process(0)
    assert_equal [2, 3, 0, 1, -3], c.jumps
    assert_equal 4, c.process(1)
    assert_equal [2, 4, 0, 1, -3], c.jumps
    assert_equal 1, c.process(4)
    assert_equal [2, 4, 0, 1, -2], c.jumps
    assert_equal -1, c.process(1)
  end

  def test_process
    s = '0
3
0
1
-3'

    c = December5.new(s)

    assert_equal [0, 3, 0, 1, -3], c.jumps
    assert_equal 0, c.process2(0)
    assert_equal [1, 3, 0, 1, -3], c.jumps
    assert_equal 1, c.process2(0)
    assert_equal [2, 3, 0, 1, -3], c.jumps
    assert_equal 4, c.process2(1)
    assert_equal [2, 2, 0, 1, -3], c.jumps
    assert_equal 1, c.process2(4)
    assert_equal [2, 2, 0, 1, -2], c.jumps
    assert_equal 3, c.process2(1)
    assert_equal [2, 3, 0, 1, -2], c.jumps
    assert_equal 4, c.process2(3)
    assert_equal [2, 3, 0, 2, -2], c.jumps
    assert_equal 2, c.process2(4)
    assert_equal [2, 3, 0, 2, -1], c.jumps
    assert_equal 2, c.process2(2)
    assert_equal [2, 3, 1, 2, -1], c.jumps
    assert_equal 3, c.process2(2)
    assert_equal [2, 3, 2, 2, -1], c.jumps
    assert_equal -1, c.process2(3)
    assert_equal [2, 3, 2, 3, -1], c.jumps
  end
end
