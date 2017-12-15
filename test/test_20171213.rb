require 'minitest/autorun'

require 'advent_of_code'

class Test20171213 < Minitest::Test
  def test_step1
    sim = December13.new
    
    text = '0: 3
1: 2
4: 4
6: 4'
    
    sim.load(text)

    assert_equal 7, sim.layers.length
    
    assert_equal 24, sim.process_step1
  end
end
