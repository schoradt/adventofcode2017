require "minitest/autorun"

require 'advent_of_code';

class Test20171207 < Minitest::Test
  def test_parse
    s = 'pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)'
    
    c = December7.new(s)
    
    assert_equal 'tknk', c.root.name
    
    #assert_equal false, c.root.check_balance
  end
end