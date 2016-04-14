require_relative 'heap'

class HeapGraph < Heap
  def initialize(arr=[])
    super
  end

  def search(value, method=:breadth_first)
    return breadth_first_search(value, [0]) if method == :breadth_first
    return depth_first_search(value, 0)
  end

  def breadth_first_search(value, to_visit=[])
    # puts "breadth_first_search value in #{to_visit}"
    return -1 if to_visit.length == 0
    i = to_visit.shift
    # puts "check i #{i} : #{@arr[i]}"
    return i if @arr[i] == value

    to_visit.push(left(i)) unless left(i).nil?
    to_visit.push(right(i)) unless right(i).nil?
    breadth_first_search(value, to_visit)
  end

  def depth_first_search(value, index)
    return -1 if index.nil?
    # in-order traversal
    # puts "check #{index}: #{@arr[index]}"
    depth_first_search(value, left(index))
    return index if @arr[index] == value
    depth_first_search(value, right(index))
  end
end

data = [9, 2, 6, 5, 3, 10, 1, 7]
hg = HeapGraph.new(data)
# hg.search(8)
puts "hg.breadth_first_search(1, [0]) #{hg.breadth_first_search(1, [0])}"
puts "hg.depth_first_search(1, 0) #{hg.depth_first_search(1, 0)}"
puts "hg[6] #{hg.to_a[6]}"