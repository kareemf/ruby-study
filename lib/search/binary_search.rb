require_relative '../utils'

module Search
  include Utils

  def self.binary_search(value, arr)
    # input must be sorted
    raise ArgumentError if !Utils.sorted?(arr)

    left_bound = 0
    right_bound = arr.length

    while left_bound + 1 < right_bound
      mid_point = ((right_bound + left_bound) / 2).floor
      if value < arr[mid_point]
        right_bound = mid_point
      else
        left_bound = mid_point
      end
    end

    return left_bound if arr[left_bound] == value
    return -1
  end
end
