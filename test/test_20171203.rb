require 'minitest/autorun'

require 'advent_of_code'

class Test20171203 < Minitest::Test
  def test_build
    ss = SpiralStore.new

    assert_equal 0, ss.dimen
    assert_equal [], ss.store

    ss.add_dimen

    1.upto(10) do |i|
      # puts ss.store.to_s

      assert_equal i, ss.dimen
      assert_equal ss.store.length**2, ss.last_address

      ss.add_dimen
    end
  end

  def test_xy
    ss = December3.fill_spirals_to(9)

    assert_equal 2, ss.dimen
    assert_equal [[5, 4, 3], [6, 1, 2], [7, 8, 9]], ss.store
    assert_equal 9, ss.last_address

    assert_equal 1, ss.x(1)
    assert_equal 1, ss.y(1)

    assert_equal 1, ss.x(2)
    assert_equal 2, ss.y(2)

    assert_equal 1, ss.x(6)
    assert_equal 0, ss.y(6)

    assert_equal 0, ss.x(4)
    assert_equal 1, ss.y(4)

    ss.add_dimen

    assert_equal [[nil, nil, nil, nil, nil], [nil, 5, 4, 3, nil], [nil, 6, 1, 2, nil], [nil, 7, 8, 9, nil], [nil, nil, nil, nil, nil]], ss.store

    assert_equal 3, ss.x(10)
    assert_equal 4, ss.y(10)
  end

  def test_neighbours
    v = December3.fill_neigbored(900)

    assert_equal 931, v
  end
end
