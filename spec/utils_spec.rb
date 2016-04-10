require_relative './spec_helper'
require_relative '../lib/utils'

def sorted_tests(method)
  Proc.new do
    describe "when testing an empty array" do
      it "should return true" do
        Utils.sorted?([], method).must_equal true
      end
    end

    describe "when testing an array with one item" do
      it "should return true" do
        Utils.sorted?([1], method).must_equal true
      end
    end

    describe "when testing an array with two items" do
      it "should return true" do
        Utils.sorted?([1, 1], method).must_equal true
        Utils.sorted?([1, 2], method).must_equal true
        Utils.sorted?([2, 1], method).must_equal true
      end
    end

    describe "when testing a sorted? array with more than two items" do
      it "should return true" do
        data = [1, 1, 1]
        Utils.sorted?(data, method).must_equal true
        data = [1, 2, 3]
        Utils.sorted?(data, method).must_equal true
        Utils.sorted?(data.reverse, method).must_equal true
        data = [1, 2, 3, 4, 5]
        Utils.sorted?(data, method).must_equal true
        Utils.sorted?(data.reverse, method).must_equal true
      end
    end

    describe "when testing an unsorted array with  more than two items" do
      it "should return false" do
        Utils.sorted?([2, 1, 3]).must_equal false
        Utils.sorted?([1, 3, 1]).must_equal false
      end
    end
  end
end

describe "Utils.sorted?" do
  describe "without method (2nd) arugment" do
    it "should it should still work" do
      Utils.sorted?([]).must_equal true
    end
  end
  [:iterative, :recursive].each do |method|
    describe "#{method}", &sorted_tests(method)
  end
end