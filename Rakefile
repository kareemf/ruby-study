require "rake"
require "rake/testtask"

task default: %w[test]

Rake::TestTask.new do |t|
    t.libs << "spec"
    t.test_files = FileList['spec/*_spec.rb']
    t.verbose = false
    t.warning = false # hide `circular require` warning triggered by Guard
  end