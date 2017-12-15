require 'minitest/autorun'

require 'advent_of_code'

class Test20171210 < Minitest::Test
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
  
  def test_hash
    assert_equal 'a2582a3a0e66e6e86e3812dcb672a272', December10.new(256).knot_hash('')
    assert_equal '33efeb34ea91902bb2f59c9920caa6cd', December10.new(256).knot_hash('AoC 2017')
    assert_equal '3efbe78a8d82f29979031a4aa0b16a9d', December10.new(256).knot_hash('1,2,3')
    assert_equal '63960835bcdc130f0b66d7ff4f6a5a8e', December10.new(256).knot_hash('1,2,4') 
  end
end
