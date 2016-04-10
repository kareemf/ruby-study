require_relative '../utils'

module Sorts
  include Utils

  def self.insertion_sort(arr)
    # conserider 1st element already sorted, i -> element to insert
    for i in 1...(arr.length)
      # 0..i-1 -> sorted
      j = i - 1
      while j >= 0 && arr[i] < arr[j]
        Utils.swap(arr, i, j)
        i = i -1
        j = j -1
      end
    end
    arr
  end
end