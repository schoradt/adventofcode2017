require 'minitest/autorun'

require 'advent_of_code'

class Test20171209 < Minitest::Test
  def test_parse
    scorer = December9.new

    assert_equal 1, scorer.score('{}')
    assert_equal 6, scorer.score('{{{}}}')
    assert_equal 5, scorer.score('{{},{}}')
    assert_equal 16, scorer.score('{{{},{},{{}}}}')
    assert_equal 1, scorer.score('{<a>,<a>,<a>,<a>}')
    assert_equal 9, scorer.score('{{<ab>},{<ab>},{<ab>},{<ab>}}')
    assert_equal 9, scorer.score('{{<!!>},{<!!>},{<!!>},{<!!>}}')
    assert_equal 3, scorer.score('{{<a!>},{<a!>},{<a!>},{<ab>}}')
  end

  def test_garbage
    scorer = December9.new

    assert_equal 0, scorer.count_garbage('<>')
    assert_equal 17, scorer.count_garbage('<random characters>')
    assert_equal 3, scorer.count_garbage('<<<<>')
    assert_equal 2, scorer.count_garbage('<{!>}>')
    assert_equal 0, scorer.count_garbage('<!!>')
    assert_equal 0, scorer.count_garbage('<!!!>>')
    assert_equal 10, scorer.count_garbage('<{o"i!a,<{i<a>')
  end
end
