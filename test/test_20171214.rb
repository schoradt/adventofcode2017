require 'minitest/autorun'

require 'advent_of_code'

class Test20171213 < Minitest::Test
  def test_step1
    defrag = December14.new
    
    assert_equal 8108, defrag.process_step1('flqrgnkx')
  end
  
  def test_step2
    defrag = December14.new
    
    assert_equal 1242, defrag.process_step2('flqrgnkx')
  end
end
