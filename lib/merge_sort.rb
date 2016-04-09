module Sorts
  def self.merge_sort(arr)
    return arr if arr.length < 2
    mid_point = (arr.length / 2).floor
    left = merge_sort(arr[0...mid_point])
    right = merge_sort(arr[mid_point...arr.length])
    merge(left, right)
  end

  private
  def self.merge(left, right)
    arr = []
    i = 0
    j = 0
    while i < left.length and j < right.length
      if left[i] < right[j]
        arr.push(left[i])
        i = i + 1
      else
        arr.push(right[j])
        j = j + 1
      end
    end

    if i < left.length
      arr.concat(left[i...left.length])
    end
    if j < right.length
      arr.concat(right[j...right.length])
    end
    arr
  end
end