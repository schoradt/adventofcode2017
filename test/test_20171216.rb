require 'minitest/autorun'

require 'advent_of_code'

class Test20171216 < Minitest::Test
  def test_step1
    dance = December16.new
    
    dance.init('abcde')
    
    assert_equal true, dance.spin(1)
    assert_equal 'eabcd', dance.to_s
    
    assert_equal true, dance.exchange(3, 4)
    assert_equal 'eabdc', dance.to_s
    
    assert_equal true, dance.partner('e', 'b')
    assert_equal 'baedc', dance.to_s
    
    dance.init('abcde')
    
    assert_equal true, dance.dance("s1,x3/4,pe/b")
    assert_equal 'baedc', dance.to_s
    
  end
  
  
end
