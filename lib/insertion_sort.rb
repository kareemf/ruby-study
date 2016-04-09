require_relative './utils'

module Sorts
  include Utils

  def self.insertion_sort(arr)
    # conserider 1st element already sorted, i -> element to insert
    for i in 1...(arr.length)
      # 0..i-1 -> sorted
      for j in (i-1).downto(0)
        if arr[i] < arr[j]
          Utils.swap(arr, i, j)
          i = i -1
        else
          # element already in proper place
          break
        end
      end
    end
    arr
  end
end