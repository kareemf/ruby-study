require_relative './spec_helper'

module SharedSortSpec
  def self.run_spec(options={})
    Proc.new do
      func_name = options[:func_name]

      describe "shared sort spec" do
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
            skip if !options[:test_duplcates]
            Sorts.send(func_name, @data).must_equal @data.sort
          end
        end
      end
    end
  end
end