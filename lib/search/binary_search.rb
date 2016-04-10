module Search
  # input must be sorted
  def self.binary_search(value, arr)
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

  def self.sorted?(arr)
    return true if arr.length < 2

    i = arr.length / 2
    left = arr[0...i]
    right = arr[(i+1)...arr.length]
    mid = arr[i]

    sorted_neighbors = sorted?(left) && sorted?(right)
    return false if !sorted_neighbors

    sorted_increasing = (mid >= left.last)
    sorted_decreasing = (mid <= left.last)

    if !right.first.nil? # ex arr[(i+1)...arr.length] -> [1,2][2...2] -> []
      sorted_increasing = sorted_increasing && (mid <= right.first)
      sorted_decreasing = sorted_decreasing && (mid >= right.first)
    end

    sorted_increasing || sorted_decreasing
  end
end
