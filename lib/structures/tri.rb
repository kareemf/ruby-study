module Structures
  class Node
    attr_accessor :id, :data, :children

    def initialize(id=nil)
      @id = id
      @data = nil
      @children = []
    end

    def to_s
      "id: #{@id} data: #{@data} children: #{@children.map(&:to_s)}"
    end
  end
  class Tri
    @@valid_classes = [Fixnum, Float, Symbol, String]

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

    def length
      # TODO
      return 0
    end

    private
    def enumerable_from_key(key)
      return key if key.respond_to?(:each)

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

    def self.is_numeric?(s)
      !!/\A[+-]?\d+\Z/.match(s)
    end
  end
end