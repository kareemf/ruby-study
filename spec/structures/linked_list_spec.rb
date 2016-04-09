require_relative '../spec_helper'
require_relative '../../lib/structures/linked_list'

describe Node do
  describe "when initialized with no arguements" do
    it "should raise an exception" do
      ->{ Node.new }.must_raise ArgumentError
    end
  end

  describe "when initialized with a value" do
    before do
      @node = Node.new(1)
    end

    it "that should be its value" do
      @node.value.must_equal 1
    end
    it "should have no next node" do
      @node.next.must_be_nil
    end

    describe "when assigned a next node" do
      before do
        @next = Node.new(2)
        @node.next = @next
      end

      it "should have a next node" do
        @node.next.must_equal @next
      end

      it "to_s should incude values for both nodes" do
        @node.to_s.must_equal "value: 1, next: 2"
      end
    end
  end
end

test_nil_head = lambda { @linked_list.head.must_be_nil }
test_is_empty = lambda { @linked_list.to_a.must_equal [] }

describe LinkedList do
  describe "on initializaiton" do

    describe "when initialized with no arguements" do
      before do
        @linked_list = LinkedList.new
      end

      it "should have a nil head", &test_nil_head
      it "to_a uld be an empty array", &test_is_empty
    end

    describe "when initialized with an empty array" do
      before do
        @linked_list = LinkedList.new([])
      end

      it "should have a nil head", &test_nil_head
      it "to_a should be an empty array", &test_is_empty
    end

    describe "when initialized with a non-empty array" do
      before do
        @data = [1, 2, 3, 4]
        @linked_list = LinkedList.new(@data)
      end

      it "should have a head equal to the first element " do
        @linked_list.head.value.must_equal 1
      end

      it "to_a should return a copy of the array" do
        @linked_list.to_a.must_equal @data
      end

      it "should have the same first as the array" do
        @linked_list.first.must_equal @data.first
      end

      it "should have the same last as the array" do
        @linked_list.last.must_equal @data.last
      end
    end
  end

  describe "on mutation" do
    before do
      @data = [1, 2, 3]
      @linked_list = LinkedList.new(@data)
    end

    describe "when an element is added" do
      it "should append element to array representation" do
        @linked_list.push(4)
        @linked_list.to_a.must_equal @data.push(4)
      end
    end

    describe "when an element is removed" do
      it "should remove element from array representation" do
        @linked_list.remove(@data.last)
        @linked_list.to_a.must_equal @data[0...@data.length - 1]
      end
    end

    describe "when all elements removed in order" do
      it "should have an empty array representation" do
        @data.each do |e|
          @linked_list.remove(e)
        end
        @linked_list.to_a.must_equal []
      end
    end

    describe "when all elements removed in reverse order" do
      it "should have an empty array representation" do
        @data.reverse.each do |e|
          @linked_list.remove(e)
        end
        @linked_list.to_a.must_equal []
      end
    end
  end

  describe "on reversal" do
    before do
      @data = [1, 2, 3]
      @linked_list = LinkedList.new(@data)
    end

    describe "(iteratively)" do
      describe "when list has more than one element" do
        it "should create a reversed copy" do
          @linked_list.reverse.to_a.must_equal @data.reverse
        end

        it "should not mutate the original copy" do
          reversed = @linked_list.reverse
          @linked_list.to_a.must_equal @data
        end
      end

      describe "when list is empty" do
        it "to_a should be an empty array" do
          @linked_list = LinkedList.new([])
          @linked_list.reverse.to_a.must_equal []
        end
      end

      describe "when list has single element" do
        it "to_a should contain only the item" do
          @linked_list = LinkedList.new([1])
          @linked_list.reverse.to_a.must_equal [1]
        end
      end
    end

    describe "(recursively)" do
      describe "when list has more than one element" do
        it "should create a reversed copy" do
          @linked_list.reverse(:resursive).to_a.must_equal @data.reverse
        end

        it "should not mutate the original copy" do
          reversed = @linked_list.reverse(:resursive)
          @linked_list.to_a.must_equal @data
        end
      end

      describe "when list is empty" do
        it "to_a should be an empty array" do
          @linked_list = LinkedList.new([])
          @linked_list.reverse(:resursive).to_a.must_equal []
        end
      end

      describe "when list has single element" do
        it "to_a should contain only the item" do
          @linked_list = LinkedList.new([1])
          @linked_list.reverse(:resursive).to_a.must_equal [1]
        end
      end
    end
  end
end