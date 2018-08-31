def merge_sort(arr)
  return arr if arr.size < 2
  left, right = arr.partition.with_index {|_, i| i < arr.size / 2}

  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  res = []
  lIdx, rIdx = 0, 0

  while res.size < left.size + right.size
    leftHead = lIdx < left.size ? left[lIdx] : 0x7fffffff
    rightHead = rIdx < right.size ? right[rIdx] : 0x7fffffff

    if leftHead < rightHead
      res << left[lIdx]
      lIdx += 1
    else
      res << right[rIdx]
      rIdx += 1
    end
  end
  res
end
