require "minitest/autorun"

require 'AdventOfCode';

class Test20171203 < Minitest::Test
    def test_build
      ss = SpiralStore.new

      assert_equal 0, ss.dimen
      assert_equal [], ss.getStore

      ss.addDimen()

      assert_equal 1, ss.dimen
      assert_equal [[1]], ss.getStore
      assert_equal 1, ss.lastAddress

      ss.addDimen()

      assert_equal 2, ss.dimen
      assert_equal [[5, 4, 3], [6, 1, 2], [7, 8, 9]], ss.getStore
      assert_equal 9, ss.lastAddress

      #puts ss.getStore.to_s

      ss.addDimen()

      ##puts ss.getStore.to_s

      assert_equal 3, ss.dimen
      assert_equal 25, ss.lastAddress      
  end

  def test_xy
      ss = SpiralStore.fillSpiralsTo(9)

      assert_equal 2, ss.dimen
      assert_equal [[5, 4, 3], [6, 1, 2], [7, 8, 9]], ss.getStore
      assert_equal 9, ss.lastAddress

      assert_equal 1, ss.getX(1)
      assert_equal 1, ss.getY(1)

      assert_equal 1, ss.getX(2)
      assert_equal 2, ss.getY(2)

      assert_equal 1, ss.getX(6)
      assert_equal 0, ss.getY(6)

      assert_equal 0, ss.getX(4)
      assert_equal 1, ss.getY(4)
  end


  def test_all
      ss = SpiralStore.fillSpiralsTo(277678)

      #puts ss.getStore.to_s

      assert_equal 264, ss.dimen
      assert_equal 277729, ss.lastAddress

      assert_equal 263, ss.getX(1)
      assert_equal 263, ss.getY(1)

      assert_equal 526, ss.getX(277678)
      assert_equal 475, ss.getY(277678)

      assert_equal 475, (ss.getY(277678) - ss.getY(1)).abs + (ss.getX(277678) - ss.getX(1))


  end
end