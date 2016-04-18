module Structures
  class Tri
    class Node
      attr_accessor :id, :data, :children

      def initialize(id=nil)
        @id = id
        @data = nil
        @children = []
      end

      def inspect
        {
          :id => @id,
          :data => @data,
          :children => @children.map(&:inspect)
        }.to_s
      end

      def to_s
        inspect
      end
    end

    def initialize()
      @root = Node.new
    end

    def [](key)
      node = @root
      iterable = enumerable_from_key(key)
      iterable.each do | item |
        child = node.children.find {|child| child.id == item}
        return nil unless child
        node = child
      end

      node.data
    end

    def []=(key, value)
      iterable = enumerable_from_key(key)
      node = @root
      iterable.each do | item |
        child = node.children.find {|child| child.id == item}
        if child
          node = child
        else
          new_node = Node.new(item)
          node.children.push(new_node)
          node = new_node
        end
      end

      (node.data = value)
    end

    def inspect
      k_v_pairs = to_a
      pair_strs = k_v_pairs.map { |pair|
        "#{pair[0].inspect}=>#{pair[1].inspect}"
      }

      "{#{ pair_strs.join(', ') }}"
    end

    def to_s
      inspect
    end

    def to_h
      eval(to_s)
    end

    def to_a
      traverse(@root)
    end

    def length
      to_a.length
    end

    def keys
      to_a.map { |k_v_pairs| k_v_pairs[0] }
    end

    def values
      to_a.map { |k_v_pairs| k_v_pairs[1] }
    end

    private
    def enumerable_from_key(key)
      case key
      when String
        key.split('')
      when Symbol
        key.to_s.split('').map(&:to_sym)
      when Fixnum, Float
        key.to_s.split('').map do | i |
          # handle signs and floating points by keeping them as srings
          # ex: -1.2 -> ["-", 1, ".", 2]
          next i.to_i if Tri.is_numeric?(i)
          i
        end
      else
          [key]
      end
    end

    def key_from_enumerable(arr)
      # the last item is the ambasador for what the array represents
      # ex: ['-', 1, '.', 0].last == 0, meaning the input is numeric
      case arr.last
      when String
        arr.join
      when Symbol
        arr.join.to_sym
      when Fixnum, Float
        conversion_method = arr.include?('.') ? :to_f : :to_i
        arr.join.send(conversion_method)
      else
        arr.last
      end
    end

    def traverse(node, path=[], k_v_pairs=[])
      return k_v_pairs if node.nil?

      # don't add the root to path
      path.push(node.id) unless node.id.nil?

      unless node.data.nil?
        key = key_from_enumerable(path)
        k_v_pairs.push([key, node.data])
      end

      node.children.map { |child| traverse(child, path.clone, k_v_pairs) }
      k_v_pairs
    end

    def self.is_numeric?(s)
      !!/\A[+-]?\d+\Z/.match(s)
    end
  end
end