require_relative '../spec_helper'
require_relative '../../lib/search/binary_search'

def sorted_tests(method)
  Proc.new do
    describe "when testing an empty array" do
      it "should return true" do
        Search.sorted?([], method).must_equal true
      end
    end

    describe "when testing an array with one item" do
      it "should return true" do
        Search.sorted?([1], method).must_equal true
      end
    end

    describe "when testing an array with two items" do
      it "should return true" do
        Search.sorted?([1, 1], method).must_equal true
        Search.sorted?([1, 2], method).must_equal true
        Search.sorted?([2, 1], method).must_equal true
      end
    end

    describe "when testing a sorted? array with more than two items" do
      it "should return true" do
        data = [1, 1, 1]
        Search.sorted?(data, method).must_equal true
        data = [1, 2, 3]
        Search.sorted?(data, method).must_equal true
        Search.sorted?(data.reverse, method).must_equal true
        data = [1, 2, 3, 4, 5]
        Search.sorted?(data, method).must_equal true
        Search.sorted?(data.reverse, method).must_equal true
      end
    end

    describe "when testing an unsorted array with  more than two items" do
      it "should return false" do
        Search.sorted?([2, 1, 3]).must_equal false
        Search.sorted?([1, 3, 1]).must_equal false
      end
    end
  end
end

describe "Search.sorted?" do
  describe "without method (2nd) arugment" do
    it "should it should still work" do
      Search.sorted?([]).must_equal true
    end
  end
  [:iterative, :recursive].each do |method|
    describe "#{method}", &sorted_tests(method)
  end
end

describe "Search.binary_search" do
  describe "when searching for 1 in []" do
    it "should return -1" do
      Search.binary_search(1, []).must_equal -1
    end
  end

  describe "when searching for 1 in [2]" do
    it "should return -1" do
      Search.binary_search(1, [2]).must_equal -1
    end
  end

  describe "when searching for 1 in [1]" do
    it "should return 0" do
      Search.binary_search(1, [1]).must_equal 0
    end
  end
  describe "when searching a unsorted array" do
    it "should throw an error" do
      ->{ Search.binary_search(1, [2, 1, 3]) }.must_raise ArgumentError
    end
  end
  describe "when searching a sorted array" do
    before { @data = [1, 2, 3, 5, 6, 7, 9, 10] }

    describe "when searching for first item" do
      it "should retuirn 0" do
        Search.binary_search(@data.first, @data).must_equal 0
      end
    end

    describe "when searching for last item" do
      it "should return last index" do
        Search.binary_search(@data.last, @data).must_equal (@data.length - 1)
      end
    end

    describe "when searching for middle item" do
      it "should return middle index" do
        middle_index = (@data.length - 1) / 2
        Search.binary_search(@data[middle_index], @data).must_equal middle_index
      end
    end
  end
end