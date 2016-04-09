module Sorts
  # does NOT handle duplicates
  def self.quick_sort_uniq(arr, depth=0)
    # puts "#{"\t" * depth}arr #{arr}"
    return arr if arr.length < 2
    pi = pivot_index(arr)
    # puts "#{"\t" * depth}pi #{pi}; pivot #{arr[pi]}"
    left, right = pivot_uniq(arr, pi, depth)
    # puts "#{"\t" * depth}left #{left};right #{right}"
    quick_sort_uniq(left, depth + 1) + [arr[pi]] + quick_sort_uniq(right, depth + 1)
  end

  def self.pivot_uniq(arr, pi, depth=0)
    pivot = arr[pi]
    left = []; right = []
    i = 0; j = arr.length - 1
    while i < j # i and j converge on pivot, eventually
      while arr[i] < pivot
        left.push(arr[i])
        i = i + 1
      end

      while arr[j] > pivot
        right.push(arr[j])
        j = j - 1
      end

      # swap
      # puts "#{"\t" * depth}swap #{arr[j]} with #{arr[i]}"
      unless arr[j] == pivot
        left.push(arr[j])
        j = j - 1
      end
      unless arr[i] == pivot
        right.push(arr[i])
        i = i + 1
      end
      # puts "#{"\t" * depth}left #{left};right #{right}"
    end
    return [left, right]
  end

  def self.pivot_index(arr)
    r = Random.new
    r.rand(0...arr.length)
  end
end