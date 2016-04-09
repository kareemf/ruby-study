require 'simplecov'
SimpleCov.start unless ENV['NO_COVERAGE']

require 'minitest/autorun'
require "minitest/reporters"
require 'minitest/spec'
Minitest::Reporters.use!