require_relative '../utils'

module Sorts
  include Utils

  # TODO: doesn't handl dupes
  def self.selection_sort(arr)
    # find the smallest element, swap it to the front
    return arr if arr.length < 2
    smallest_i = arr.index(arr.min)
    Utils.swap(arr, 0, smallest_i)
    # fill position front to back via i
    # first index was was just explictly sorted
    # last index will be implicitly sorted by the end
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
