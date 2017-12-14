require 'minitest/autorun'

require 'advent_of_code'

class Test20171211 < Minitest::Test
  def test_move
    hex = December11.new

    assert_equal 0, hex.x
    assert_equal 0, hex.y
    
    hex.north
    
    assert_equal 0, hex.x
    assert_equal -1, hex.y
    
    hex.south
    
    assert_equal 0, hex.x
    assert_equal 0, hex.y
    
    hex.northeast
    
    assert_equal 1, hex.x
    assert_equal -1, hex.y
    
    hex.southwest
    
    assert_equal 0, hex.x
    assert_equal 0, hex.y
    
    hex.northwest
    
    assert_equal -1, hex.x
    assert_equal 0, hex.y
    
    hex.southeast
    
    assert_equal 0, hex.x
    assert_equal 0, hex.y
  end
  
  def test_distance
    zero = December11::Cube.new
    
    assert_equal 3, December11.new.northeast.northeast.northeast.cube.distance(zero)
    assert_equal 0, December11.new.northeast.northeast.southwest.southwest.cube.distance(zero)
    assert_equal 2, December11.new.northeast.northeast.south.south.cube.distance(zero)
    assert_equal 3, December11.new.southeast.southwest.southeast.southwest.southwest.cube.distance(zero)
  end
  
  def test_process_step1
    assert_equal 3, December11.process_step1('ne,ne,ne')
    assert_equal 0, December11.process_step1('ne,ne,sw,sw')
    assert_equal 2, December11.process_step1('ne,ne,s,s')
    assert_equal 3, December11.process_step1('se,sw,se,sw,sw')
  end
  
  def test_process_step2
    assert_equal 3, December11.process_step2('ne,ne,ne')
    assert_equal 2, December11.process_step2('ne,ne,sw,sw')
    assert_equal 2, December11.process_step2('ne,ne,s,s')
    assert_equal 3, December11.process_step2('se,sw,se,sw,sw')
  end
end
