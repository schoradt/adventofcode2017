require 'minitest/autorun'
require 'benchmark'

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
    
    assert_equal true, dance.dance(dance.prepare("s1,x3/4,pe/b"))
    assert_equal 'baedc', dance.to_s
    
    assert_equal true, dance.spin(4)
    assert_equal 'cdeab', dance.to_s
    
    dance.init('abcdefghijklmnop')
    
    10000.downto(0) do |i|
      dance.spin(1)
      #dance.exchange(12, 7)
      #dance.partner('e',  'n')
    end
  end
  
  def test_benchmark
    dance = December16.new
    
    dance.init('abcdefghijklmnop')
    
    text = File.read('data/20171216.txt')
    steps = dance.prepare(text)
    
    Benchmark.bmbm do |x|
      x.report('dance') { 100.times { dance.dance(steps) } }
      x.report('spin') { 100_000.times { dance.spin(14) } }
      x.report('exchange') { 100_000.times { dance.exchange(12, 7) } }
      x.report('partner') { 100_000.times { dance.partner('e', 'n') } }
    end
  end
  
  
end
