module Structures
  class Node
    attr_accessor :id, :data, :type, :children

    def initialize(id=nil, type=nil)
      @id = id
      @type = type
      @data = nil
      @children = []
    end

    def to_s
      "id: #{@id} data: #{@data} type: #{@type} children: #{@children.map { |c| c.to_s }}"
    end
  end
  class Tri
    @@valid_classes = [Fixnum, Float, Symbol, String]

    def initialize()
      @root = Node.new
    end

    def [](key)
      Tri.validate_key!(key)

      node = @root
      iterable = iterable_from_key(key)
      iterable.each do | item |
        if (child = node.children.find {|child| child.type === key && child.id == item})
          node = child
        else
          # didnt find a node with matching id, or found node with matching id
          # but wrong type, ex wanted :a, :b, :c, got :a, :b, 'c'
          return nil
        end
      end

      node.data
    end

    def []=(key, value)
      Tri.validate_key!(key)

      iterable = iterable_from_key(key)
      node = @root
      iterable.each do | item |
        if (child = node.children.find {|child| child.type === key && child.id == item})
          node = child
        else
          new_node = Node.new(item)
          new_node.type = key.class
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
    def iterable_from_key(key)
      return nil if key.nil?
      return key if key.respond_to?(:each)

      case key
      when String
        key.split('')
      when Symbol, Fixnum, Float
        key.to_s.split('')
      end
    end

    def self.validate_key!(key)
      valid_key = key.respond_to?(:each) || @@valid_classes.include?(key.class)
      Tri.raise_key_error unless valid_key
    end

    def self.raise_key_error
      raise ArgumentError.new("keys must respond to :each or be numeric")
    end
  end
end
