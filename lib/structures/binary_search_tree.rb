module Structures
  # used an array based implementation for Heaps, so using a referenced based implementation here, for good measure
  class BinarySearchTree
    class Node
      attr_accessor :left, :right, :parent, :value
      def initialize(value)
        @value = value
        @left = nil
        @right = nil
        @parent = nil
      end

      def to_s
        "value: #{@value} left: #{@left.value rescue nil} right: #{@right.value rescue nil} parent: #{@parent.value rescue nil}"
      end
    end

    attr_reader :root

    def initialize(arr=[])
      @root = nil
      arr.each { |e| self.add(e) }
    end

    def search(value)
      binary_search(value, @root)
    end

    def add(value)
      new_node = Node.new(value)

      if @root.nil?
        @root = new_node
        return self
      end

      node = @root
      until node.nil?
        if value <= node.value
          if node.left.nil?
            node.left = new_node
            new_node.parent = node
            break
          end
          node = node.left
        else
          if node.right.nil?
            node.right = new_node
            new_node.parent = node
            break
          end
          node = node.right
        end
      end

      return self
    end

    def remove(value)
      delete(value, @root)
    end

    def min(node=nil)
      node = @root if node.nil?
      until node.left.nil?
        node = node.left
      end
      node.value
    end

    def max(node=nil)
      node = @root if node.nil?
      until node.right.nil?
        node = node.right
      end
      node.value
    end

    def to_s
      to_a.to_s
    end

    def to_a
      depth_first_traversal(@root).map { |node| node.value }
    end

    private
    def delete(value, subtree)
      target = binary_search(value, subtree)
      return false if target.nil?

      parent = target.parent
      left = target.left
      right = target.right

      # target has no children
      if left.nil? && right.nil?
        return delete_leaf_node(target)
      end

      # target has one child - connect target's parent to target's child. hopscotch
      if (!left.nil? && right.nil?) || (left.nil? && !right.nil?)
        return delete_single_child_node(target)
      end

      # target has two children
      delete_two_child_node(target)
    end

    def delete_leaf_node(target)
      parent = target.parent
      if target == @root
        @root = nil
      elsif parent.left == target
        parent.left = nil
      else
        parent.right = nil
      end
      target.parent = nil
      return true
    end

    def delete_single_child_node(target)
      parent = target.parent
      only_child = target.left.nil? ? target.right : target.left
        only_child.parent = parent
        if target = @root
          @root = only_child
        elsif parent.left == target
          parent.left = only_child
        else
          parent.right = only_child
        end
        return true
    end

    def delete_two_child_node(target)
      left = target.left
      max_left = max(left)
      target.value = max_left
      delete(max_left, left)
    end

    def binary_search(value, node)
      return nil if node.nil?
      return node if node.value == value
      next_node = value < node.value ? node.left : node.right
      binary_search(value, next_node)
    end

    def depth_first_traversal(node, visited=[])
      return visited if node.nil?
       # inorder traversal
       depth_first_traversal(node.left, visited)
       visited.push(node)
       depth_first_traversal(node.right, visited)
    end
  end
end