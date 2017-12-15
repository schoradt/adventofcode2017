require 'minitest/autorun'

require 'advent_of_code'

class Test20171215 < Minitest::Test
  def test_step1
    gen = December15.new(65, 8921)
    
    assert_equal 1092455, gen.generate_a
    assert_equal '00000000000100001010101101100111', gen.bin_a
    assert_equal 430625591, gen.generate_b
    assert_equal '00011001101010101101001100110111', gen.bin_b
    
    assert_equal 1181022009, gen.generate_a
    assert_equal '01000110011001001111011100111001', gen.bin_a
    assert_equal 1233683848, gen.generate_b
    assert_equal '01001001100010001000010110001000', gen.bin_b
    assert_equal '1000010110001000', gen.bin_b[16, 16]
    assert_equal false, gen.test
    
    assert_equal 245556042, gen.generate_a
    assert_equal 1431495498, gen.generate_b
    
    assert_equal 1431495498 & 65535, 245556042 & 65535
    
    assert_equal true, gen.test
    
    assert_equal 1744312007, gen.generate_a
    assert_equal 137874439, gen.generate_b
    assert_equal false, gen.test
    
    assert_equal 1352636452, gen.generate_a
    assert_equal 285222916, gen.generate_b
    assert_equal false, gen.test
    
    assert_equal 588, December15.new(65, 8921).process_step1
  end
  
  def test_step2
    gen = December15.new(65, 8921)
    
    assert_equal 1352636452, gen.generate_a2
    assert_equal 1233683848, gen.generate_b2
    
    assert_equal 1992081072, gen.generate_a2
    assert_equal 862516352, gen.generate_b2
    
    assert_equal 530830436, gen.generate_a2
    assert_equal 1159784568, gen.generate_b2
    
    assert_equal 1980017072, gen.generate_a2
    assert_equal 1616057672, gen.generate_b2
    
    assert_equal 740335192, gen.generate_a2
    assert_equal 412269392, gen.generate_b2
    
    assert_equal 309, December15.new(65, 8921).process_step2
  end
  
end
