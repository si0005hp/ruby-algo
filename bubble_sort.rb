def bubble_sort(arr)
  arr.size.times do |cycle|
    (arr.size - 1).downto(0) do |i|
      break if i < cycle
      l, r = arr[i - 1], arr[i]
      swap(arr, i - 1, i) if l > r
    end
  end
  arr
end

def swap(arr, i1, i2)
  v = arr[i1]
  arr[i1] = arr[i2]
  arr[i2] = v
end	
