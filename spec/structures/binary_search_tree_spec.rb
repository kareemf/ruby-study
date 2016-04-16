require_relative '../spec_helper'
require_relative '../../lib/structures/binary_search_tree'

BinarySearchTree = Structures::BinarySearchTree
Node = BinarySearchTree::Node

describe Structures::BinarySearchTree::Node do
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
    it "should have no parent, left, or right nodes node" do
      @node.parent.must_be_nil
      @node.left.must_be_nil
      @node.right.must_be_nil
    end
  end
end

test_nil_root = lambda { @bst.root.must_be_nil }
test_is_empty = lambda { @bst.to_a.must_equal [] }

describe Structures::BinarySearchTree do
  describe "on initializaiton" do

    describe "when initialized with no arguements" do
      before do
        @bst = BinarySearchTree.new
      end

      it "should have a nil root", &test_nil_root
      it "to_a uld be an empty array", &test_is_empty
    end

    describe "when initialized with an empty array" do
      before do
        @bst = BinarySearchTree.new([])
      end

      it "should have a nil root", &test_nil_root
      it "to_a should be an empty array", &test_is_empty
    end

    describe "when initialized with a non-empty array" do
      before do
        @data = [2, 1, 3]
        @bst = BinarySearchTree.new(@data)
      end

      it "should have a root equal to the first element " do
        @bst.root.value.must_equal 2
      end

      it "to_a should return a sorted copy of the array" do
        @bst.to_a.must_equal @data.sort
      end
    end
  end

  describe "on mutation" do
    before do
      @data = [2, 1, 3]
      @bst = BinarySearchTree.new(@data)
    end

    describe "when an element is added" do
      it "should append element to array representation" do
        @bst.add(4)
        @bst.to_a.must_equal @data.push(4).sort
      end
    end

    describe "when an element is removed" do
      it "should remove element from array representation" do
        removed = @data.last
        @bst.remove(removed)
        @bst.to_a.include?(removed).must_equal false
      end
    end

    describe "when all elements removed root first" do
      it "should have an empty array representation" do
        @data.each do |e|
          @bst.remove(e)
        end
        @bst.to_a.must_equal []
      end
    end

    describe "when all elements removed children first" do
      it "should have an empty array representation" do
        @data.reverse.each do |e|
          @bst.remove(e)
        end
        @bst.to_a.must_equal []
      end
    end
  end

  describe "on search" do
    before do
      @data = [2, 1, 3]
      @bst = BinarySearchTree.new(@data)
    end

    it "should return the fist node containing the value" do
      @bst.search(2).must_equal @bst.root
      @bst.search(1).must_equal @bst.root.left
      @bst.search(3).must_equal @bst.root.right
      @bst.search(0).must_be_nil
    end

    it "should return max when max is called" do
      @bst.max.must_equal @bst.root.right.value
    end

    it "should return min when min is called" do
      @bst.min.must_equal @bst.root.left.value
    end
  end
end