require_relative '../spec_helper'
require_relative './shared_sort_spec'
require_relative '../../lib/sorts/insertion_sort'

options = {
  func_name: :insertion_sort,
  test_duplcates: true
}

describe "insertion_sort", &SharedSortSpec.run_spec(options)