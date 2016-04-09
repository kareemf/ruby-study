require_relative './utils'

module Sorts
  include Utils

  def self.bubble_sort(arr)
    # outter loop -> current position to fill, starting with from the back
    # when the 2nd to last position is filled, the 1st is implicitly filled
    for i in (arr.length - 1).downto(1)
      # inner loop -> which element fills the ith position
      # i - 1 b/c we look ahead to compare with neighbor, and our last neightbor is i
      # puts "i = #{i}"
      for j in 0...i
        # puts "compare #{arr[j]} and #{arr[j+1]}"
        # puts "swap #{arr[j]} and #{arr[j+1]}" if arr[j] > arr[j + 1]
        Utils.swap(arr, j, j + 1) if arr[j] > arr[j + 1]
      end
    end
    return arr
  end
end