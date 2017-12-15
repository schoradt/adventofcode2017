require 'minitest/autorun'

require 'advent_of_code'

class Test20171212 < Minitest::Test
  def test_step1
    graph = December12.new
    
    text = '0 <-> 2
1 <-> 1
2 <-> 0, 3, 4
3 <-> 2, 4
4 <-> 2, 3, 6
5 <-> 6
6 <-> 4, 5'
    
    graph.load(text)

    assert_equal 6, graph.process_step1
  end
  
  def test_step2
    graph = December12.new
    
    text = '0 <-> 2
1 <-> 1
2 <-> 0, 3, 4
3 <-> 2, 4
4 <-> 2, 3, 6
5 <-> 6
6 <-> 4, 5'
    
    graph.load(text)

    assert_equal 2, graph.process_step2
  end
  
end
