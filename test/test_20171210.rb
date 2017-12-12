require 'minitest/autorun'

require 'advent_of_code'

class Test20171209 < Minitest::Test
  def test_hash
    hash = December10.new(5)

    assert_equal 0, hash.hash
    assert_equal [0, 1, 2, 3, 4], hash.data

    assert_equal true, hash.cycle(3)
    assert_equal [2, 1, 0, 3, 4], hash.data
    assert_equal 3, hash.pos

    assert_equal true, hash.cycle(4)
    assert_equal [4, 3, 0, 1, 2], hash.data
    assert_equal 3, hash.pos

    assert_equal true, hash.cycle(1)
    assert_equal [4, 3, 0, 1, 2], hash.data
    assert_equal 1, hash.pos

    assert_equal true, hash.cycle(5)
    assert_equal [3, 4, 2, 1, 0], hash.data
    assert_equal 4, hash.pos

    assert_equal 12, hash.hash
  end
end
