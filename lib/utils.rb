module Utils
  def self.swap(arr, a, b)
    t = arr[a]
    arr[a] = arr[b]
    arr[b] = t
  end

  def self.sorted?(arr, method=:iterative)
    return iterative_sorted?(arr) if method == :iterative
    recursive_sorted?(arr)
  end

  private
  def self.recursive_sorted?(arr)
    return true if arr.length < 2

    i = arr.length / 2
    left = arr[0...i]
    right = arr[(i+1)...arr.length]
    mid = arr[i]

    sorted_neighbors = recursive_sorted?(left) && recursive_sorted?(right)
    return false if !sorted_neighbors

    sorted_increasing = (mid >= left.last)
    sorted_decreasing = (mid <= left.last)

    if !right.first.nil? # ex arr[(i+1)...arr.length] -> [1,2][2...2] -> []
      sorted_increasing = sorted_increasing && (mid <= right.first)
      sorted_decreasing = sorted_decreasing && (mid >= right.first)
    end

    sorted_increasing || sorted_decreasing
  end

  def self.iterative_sorted?(arr)
    dir = nil # 0 -> decreasing, 1 -> increasing
    for i in 0...(arr.length - 1) #  -1 -> prevent runoff when looking ahead
      if !dir.nil?
        newDir = 1 if arr[i] <= arr[i + 1]
        newDir = 0 if arr[i] > arr[i + 1]
        return false if dir != newDir
      end

      if i == 0
        dir = 1 if arr[i] <= arr[i + 1]
        dir = 0 if arr[i] > arr[i + 1]
      end
    end
    true
  end
end