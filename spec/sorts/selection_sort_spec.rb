require_relative '../spec_helper'
require_relative './shared_sort_spec'
require_relative '../../lib/sorts/selection_sort'

options = {
  func_name: :selection_sort,
  test_duplcates: false
}

describe "selection_sort", &SharedSortSpec.run_spec(options)