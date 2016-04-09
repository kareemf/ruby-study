require_relative './utils'

class Heap
  include Comparable

  def initialize(arr=[])
    @arr = []
    arr.each { |element| add(element) }
  end

  def pop
    if @arr.length < 2
      # want arr to be empty after operation if it has only one item
      return @arr.pop
    end

    first = @arr.first
    last = @arr.last
    # pop the first element, move last element to root
    @arr = @arr[1...@arr.length-1].unshift(last)
    i = 0
    # move new root down so long as it is smaller than its largest child
    # stipulation: can't have a right child without having a left
    while left(i) and (@arr[left(i)] > @arr[i] || (right(i) && @arr[right(i)] > @arr[i]))
      biggest_child = left(i) #if left(i)

      if right(i)
        biggest_child = right(i) if @arr[right(i)] > @arr[biggest_child]
      end

      Utils.swap(@arr, i, biggest_child) if @arr[biggest_child] > @arr[i]
      i = biggest_child
    end
    return first
  end

  def add(element)
    @arr.push(element)
    i = @arr.length - 1
    while @arr[i] > @arr[parent(i)]
      Utils.swap(@arr, i, parent(i))
      i = parent(i)
    end
  end

  def sort
    out = []
    while !(value = self.pop).nil?
      out.unshift(value)
    end
    out
  end

  def <=> (other)
    to_a <=> other.to_a
  end

  def to_s
    @arr.to_s
  end

  def to_a
    @arr
  end

  def <=>(other)
    to_a <=> other.to_a
  end

  private
  def left(index)
    i = (2 * index) + 1
    return nil if i > @arr.length - 1
    i
  end

  def right(index)
    i = (2 * index) + 2
    return nil if i > @arr.length - 1
    i
  end

  def parent(index)
    return index if index <= 0
    ((index - 1)/2).floor
  end
end