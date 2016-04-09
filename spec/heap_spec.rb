require_relative './spec_helper'
require_relative '../lib/heap_sort'

describe Heap do
  describe "when initialized with no arguements" do
    it "should be an empty array" do
      Heap.new.to_a.must_equal []
    end
  end

  describe "when initialized with an empty array" do
    it "should be an empty array" do
      Heap.new([]).to_a.must_equal []
    end
  end

  describe "when initialized with a non-empty array" do
    before do
      @data = [1]
      @heap = Heap.new(@data)
    end

    it "to_a should return a copy of the array" do
      @heap.to_a.must_equal @data
    end

    it "second call of pop should be nil" do
      @heap.pop
      @heap.pop.must_be_nil
    end
  end

  describe "on mutation" do
    before do
      @data = [9, 2, 6, 5, 3, 10, 1, 7]
      @heap = Heap.new(@data)
    end

    describe "when an element is added" do
      it "array representation should contain all values" do
        @heap.add(4)
        (@heap.to_a - @data.push(4)).must_be_empty
      end
    end

    describe "when elements are removed" do
      before { @array = @heap.to_a.sort.reverse }

      it "should always be the largest value" do
        while @array.length > 0
          popped = @heap.pop
          popped.must_equal @array.max
          @array = @array[1...@array.length]
        end
      end

      it "should remove the element from array representation" do
        while @array.length > 0
          @heap.pop
          (@array - @heap.to_a).must_equal [@array.max]
          @array = @array[1...@array.length]
        end
      end

      it "should be an empty array after" do
        while @heap.to_a.length > 0
          @heap.pop
        end
        @heap.to_a.must_equal []
      end

      describe "on sort" do
        it "should be sorted min to max" do
          @heap.sort.must_equal @data.sort
        end
      end
    end
  end
end
