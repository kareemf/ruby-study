require_relative '../spec_helper'
require_relative '../../lib/structures/tri'

Tri = Structures::Tri
describe Structures::Tri do
  before { @tri = Tri.new }

  describe "key to enumberable conversion" do
    it "must give an array of Strings when given String input" do
      @tri.send(:enumerable_from_key, 'key').must_equal ['k', 'e', 'y']
    end

    it "must give an array of Symbols when given Symbol input" do
      @tri.send(:enumerable_from_key, :key).must_equal [:k, :e, :y]
    end

    it "must give an array of Fixnums when given (unsigned) Fixnum input" do
      @tri.send(:enumerable_from_key, 123).must_equal [1, 2, 3]
    end

    it "must give an array of Stringd and Fixnums when given signed Fixnum or Float input" do
      @tri.send(:enumerable_from_key, -1).must_equal ['-', 1]
      @tri.send(:enumerable_from_key, 1.0).must_equal [1, '.', 0]
      @tri.send(:enumerable_from_key, -1.0).must_equal ['-', 1, '.', 0]
    end

    it "must return the key wrapped in an array for non-enumerable, non-string, non-numeric keys" do
      o = Object.new
      @tri.send(:enumerable_from_key, nil).must_equal [nil]
      @tri.send(:enumerable_from_key, o).must_equal [o]
    end

    it "TODO" do
      @tri.send(:enumerable_from_key, 1).must_equal [1]
      @tri.send(:enumerable_from_key, [1]).must_equal [[1]]

    end
  end

  describe "on assignment/retrieval" do
    before do
      @assignment = (@tri[:key] = "value")
    end

    it "must return the value" do
      @assignment.must_equal "value"
    end

    it "must be able to retrieve value from key" do
      @tri[:key].must_equal "value"
    end

    it "must count the pair in its length" do
      skip
      @tri.length.must_equal 1
    end

    it "must treat strings and thier Symbol equivalent as distinct" do
      @tri["key"].must_be_nil
      @tri["key"] = "another value"
      @tri[:key].must_equal "value"
      skip
      @tri.length.must_equal 2
    end

    it "must allow a nil key" do
      @tri[nil] = "nil"
      @tri[nil].must_equal "nil"
    end
  end

  describe "representation" do
    it "must be represented by an empty hash when empty" do
      @tri.to_s.must_equal "{}"
    end

    it "must contain the key-value pair(s) in its string repr" do
      @tri[:key] = "value"
      @tri.to_s.must_equal "{:key=>\"value\"}"
      @tri["key"] = "another value"
      @tri.to_s.must_equal "{:key=>\"value\", \"key\"=>\"another value\"}"
    end
  end
end