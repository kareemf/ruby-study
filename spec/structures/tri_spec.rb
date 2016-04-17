require_relative '../spec_helper'
require_relative '../../lib/structures/tri'

Tri = Structures::Tri
describe Structures::Tri do
  before do
    @tri = Tri.new
    @assignment = (@tri[:key] = "value")
  end
  describe "on assignment/retrieval" do
    it "must return the value" do
      @assignment.must_equal "value"
    end

    it "must be able to retrieve value from key" do
      @tri[:key].must_equal "value"
    end

    it "must contain the key-value pair in its string repr" do
      skip
      @tri.to_s.must_equal "{:key=>\"value\"}"
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

    describe "when assigning a non-enumerable, non-numberic key" do
      it "must raise an exception" do
        invalid_key = Object.new
        ->{ @tri[invalid_key] }.must_raise ArgumentError
      end
    end
  end
end