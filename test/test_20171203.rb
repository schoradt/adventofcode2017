require "minitest/autorun"

require 'advent_of_code';

class Test20171203 < Minitest::Test
    def test_build
      ss = SpiralStore.new

      assert_equal 0, ss.dimen
      assert_equal [], ss.store

      ss.add_dimen()

      assert_equal 1, ss.dimen
      assert_equal [[1]], ss.store
      assert_equal 1, ss.last_address

      ss.add_dimen()

      assert_equal 2, ss.dimen
      assert_equal [[5, 4, 3], [6, 1, 2], [7, 8, 9]], ss.store
      assert_equal 9, ss.last_address

      #puts ss.getStore.to_s

      ss.add_dimen()

      ##puts ss.getStore.to_s

      assert_equal 3, ss.dimen
      assert_equal 25, ss.last_address      
  end

  def test_xy
      ss = SpiralStore.fill_spirals_to(9)

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
  end


  def test_all
      ss = SpiralStore.fill_spirals_to(277678)

      #puts ss.getStore.to_s

      assert_equal 264, ss.dimen
      assert_equal 277729, ss.last_address

      assert_equal 263, ss.x(1)
      assert_equal 263, ss.y(1)

      assert_equal 526, ss.x(277678)
      assert_equal 475, ss.y(277678)

      assert_equal 475, (ss.y(277678) - ss.y(1)).abs + (ss.x(277678) - ss.x(1))


  end
end