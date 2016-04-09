require_relative '../spec_helper'
require_relative './shared_sort_spec'
require_relative '../../lib/sorts/bubble_sort'

options = {
  func_name: :bubble_sort,
  test_duplcates: true
}

describe "bubble_sort", &SharedSortSpec.run_spec(options)