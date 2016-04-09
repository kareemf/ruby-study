require_relative '../utils'

module Sorts
  include Utils

  def self.selection_sort(arr)
    smallest_i = arr.index(arr.min)
    Utils.swap(arr, 0, smallest_i)
    # last index will be implicitly sorted
    for i in 1...(arr.length-1)
      smallest_i = i
      for j in (i+1)...arr.length
        smallest_i = j if arr[j] < arr[i]
      end
      Utils.swap(arr, i, smallest_i) if smallest_i != i
    end
    arr
  end
end
