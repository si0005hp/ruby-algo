require 'minitest/autorun'
require_relative '../linked_list'

class LinkedListTest < Minitest::Test
  def test_insert
    list = LinkedList.new
    list.insert(1)
    list.insert(3)
    list.insert(5)

    assert_equal list.size, 3
    assert_equal list.get(0), 1
    assert_equal list.get(1), 3
    assert_equal list.get(2), 5
  end

  def test_insert_with_idx
    list = LinkedList.new
    list.insert(1)
    list.insert(3)
    list.insert(5)

    list.insert(0, 9)
    list.insert(1, 7)
    list.insert(3, 11)

    list.insert(13)

    assert_equal list.size, 7
    assert_equal list.get(0), 9
    assert_equal list.get(1), 7
    assert_equal list.get(2), 1
    assert_equal list.get(3), 11
    assert_equal list.get(4), 3
    assert_equal list.get(5), 5
    assert_equal list.get(6), 13
  end

  def test_insert_illegal_1
    list = LinkedList.new
    assert_raises RuntimeError do
      list.insert(1, 9)
    end
  end

  def test_insert_illegal_2
    list = LinkedList.new
    assert_raises RuntimeError do
      list.insert(1)
      list.insert(2)
      list.insert(3)
      list.insert(4, 5)
    end
  end

  def test_remove
    list = LinkedList.new
    list.insert(1)
    list.insert(3)
    list.insert(5)
    list.remove(1)

    assert_equal list.size, 2
    assert_equal list.get(0), 1
    assert_equal list.get(1), 5

    list.remove(0)
    assert_equal list.size, 1
    assert_equal list.get(0), 5

    list.remove(0)
    assert_equal list.size, 0
  end

  def remove_illegal
    list = LinkedList.new
    list.remove(0)
  end
end