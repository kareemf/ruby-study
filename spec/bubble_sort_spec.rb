require_relative './spec_helper'
require_relative '../lib/bubble_sort'

func_name = :bubble_sort
test_duplcates = true

describe "Sorts.bubble_sort" do
  describe "when sorting an empty array" do
    it "should return an empty array" do
      Sorts.send(func_name, []).must_be_empty
    end
  end

  describe "when sorting an array with one item" do
    it "should return a copy of the array" do
      Sorts.send(func_name, [1]).must_equal [1]
    end
  end

  describe "when sorting an array with two presorted items" do
    it "should return a copy of the array" do
      Sorts.send(func_name, [1, 2]).must_equal [1, 2]
    end
  end

  describe "when sorting an array with two reverse sorted items" do
    it "should return a reversed copy of the array" do
      Sorts.send(func_name, [2, 1]).must_equal [1, 2]
    end
  end

  describe "when sorting arbitrary unique array" do
    before { @data = [9, 2, 6, 5, 3, 10, 1, 7] }

    it "should return a sorted copy of the array" do
      Sorts.send(func_name, @data).must_equal @data.sort
    end
  end

  describe "when sorting arbitrary array with duplicates" do
    before { @data = [6, 9, 2, 0, 5, 5, 3, 7, 0, 9, 3] }

    it "should return a sorted copy of the array" do
      skip if !test_duplcates
      Sorts.send(func_name, @data).must_equal @data.sort
    end
  end

end