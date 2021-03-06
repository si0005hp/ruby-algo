def quick_sort(arr)
  return arr if arr.size < 2

  pivotIdx = arr.size / 2
  pivot = arr[pivotIdx]

  lt, gt = [], []
  arr.each_with_index do |n, i|
    next if i == pivotIdx
    n < pivot ? lt << n : gt << n
  end
  quick_sort(lt) + [pivot] + quick_sort(gt)
end
