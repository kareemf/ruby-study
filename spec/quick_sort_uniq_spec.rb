require_relative './spec_helper'
require_relative './shared_sort_spec'
require_relative '../lib/quick_sort_uniq'

options = {
  func_name: :quick_sort_uniq,
  test_duplcates: false
}

describe "quick_sort_uniq", &SharedSortSpec.run_spec(options)