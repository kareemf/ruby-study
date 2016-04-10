require_relative '../spec_helper'
require_relative '../../lib/search/binary_search'

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