class LinkedList
  include Comparable

  attr_accessor :head

  class Node
    attr_reader :value
    attr_accessor :next

    def initialize(value)
      @value = value
      @next = nil
    end

    def to_s
      "value: #{@value}, next: #{@next.value rescue 'nil'}"
    end
  end

  def initialize(arr=nil)
    return (@head = nil) if arr.nil? or arr.length < 1
    from_array(arr)
  end

  def push(value)
    last_node.next = Node.new(value)
  end

  def remove(value)
    node = @head
    prevNode = nil
    while node.value != value and !node.next.nil?
      prevNode = node
      node = node.next
    end

    # reached the end without finding target
    return false if node.value != value
    # found target, hop over it so it can be GC'ed
    if prevNode.nil?
      # target is first node
      @head = @head.next
      return true
    end

    # target is anything but first
    prevNode.next = node.next
  end

  def first
    @head.value rescue nil
  end

  def last
    last_node.value rescue nil
  end

  def reverse(method=:iterative)
    return reverse_iterative if method == :iterative
    reverse_recursive(head)
  end

  def to_a
    to_array(@head)
  end

  def to_s
    to_a.to_s
  end

  def <=> (other)
    to_a <=> other.to_a
  end

  private
  def last_node
    node = @head
    while !node.next.nil?
      node = node.next
    end
    node
  end

  def reverse_iterative
    newList = self.class.new to_a

    node = newList.head
    prevNode = nil

    while !node.nil?
      nextNode = node.next
      node.next = prevNode
      prevNode = node
      node = nextNode
    end

    newList.head = prevNode

    newList
  end

  def reverse_recursive(node)
    # empty item -> already reversed
    return self.class.new if node.nil?

    if node.next.nil?
      # last item -> new head
      return self.class.new([node.value])
    end

    linked_list = reverse_recursive(node.next)
    linked_list.push(node.value)
    linked_list
  end

  def to_array(node)
    return [] if node.nil?
    [node.value] + to_array(node.next)
  end

  def from_array(arr)
    @head = Node.new(arr.first)

    prevNode = @head
    arr[1...arr.length].each do |e|
      node = Node.new(e)
      prevNode.next = node
      prevNode = node
    end
  end
end