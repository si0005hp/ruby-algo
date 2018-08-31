class LinkedList
  class Cell
    attr_accessor :val, :next

    def initialize(v, n)
      @val = v
      @next = n
    end
  end

  attr_accessor :head, :last, :size

  def initialize
    @size = 0
  end

  def insert(idx = @size, v)
    validate_idx(idx, false)

    if idx == 0 # insert to head
      curHead = @head
      @head = Cell.new(v, curHead)
      if curHead.nil?
        @last = @head
      end
    elsif idx == @size # insert to last
      newCell = Cell.new(v, nil)
      @last.next = newCell
      @last = newCell
    else
      prevCell = cell(idx - 1)
      nextCell = prevCell.next
      newCell = Cell.new(v, nextCell)
      prevCell.next = newCell
    end
    @size += 1
  end

  def get(idx)
    cell(idx).val
  end

  def remove(idx)
    validate_idx(idx, true)

    ret = 0
    if idx == 0 # remove head
      raise "No elements so far." if @head == nil
      ret = @head.val
      @head = @head.next
      if @head == nil
        @last = nil
      end
    elsif idx == size # remove last
      ret = @last.val
      if @size < 2
        @head, @last = nil, nil
      else
        prevCell = cell(idx - 1)
        prevCell.next = nil
        @last = prevCell
      end
    else
      prevCell = cell(idx - 1)
      targetCell = prevCell.next
      nextCell = targetCell.next
      ret = targetCell.val
      prevCell.next = nextCell
    end
    @size -= 1
    ret
  end

  private

  def cell(idx)
    validate_idx(idx, false)
    cell = @head
    idx.times {cell = cell.next}
    cell
  end

  def validate_idx(idx, is_rm)
    threshold = is_rm ? @size - 1 : @size
    raise "Illegal index: #{idx}, while current size: #{@size}" if idx > threshold || idx < 0
  end
end