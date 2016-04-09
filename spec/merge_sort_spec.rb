require_relative './spec_helper'
require_relative './shared_sort_spec'
require_relative '../lib/merge_sort'

options = {
  func_name: :merge_sort,
  test_duplcates: true
}

describe "merge_sort", &SharedSortSpec.run_spec(options)