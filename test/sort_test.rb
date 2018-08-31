require 'minitest/autorun'
require_relative '../bubble_sort'
require_relative '../quick_sort'
require_relative '../merge_sort'

def testdata(n)
  data = []
  n.times { data << rand(1..100) }
  data
end

class SortTest < Minitest::Test
  def test_bubble_sort
    data = testdata(10)
    assert_equal bubble_sort(data), data.sort
  end

  def test_quick_sort
    data = testdata(10)
    assert_equal quick_sort(data), data.sort
  end

  def test_merge_sort
    data = testdata(10)
    assert_equal merge_sort(data), data.sort
  end
end