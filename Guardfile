# More info at https://github.com/guard/guard#readme

# guard :minitest, test_folders: 'spec', test_file_patterns: '*_spec.rb' do
#   watch(%r{^spec/(.*)_spec\.rb$})
#   watch(%r{^lib/(.+)\.rb$})         { |m| "spec/#{m[1]}_spec.rb" }
#   watch(%r{^spec/spec_helper\.rb$}) { 'spec' }
# end


guard :minitest do
  watch(%r{(.*)\.rb$})
  watch(%r{^spec/(.*)_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})         { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^spec/spec_helper\.rb$}) { 'spec' }
end

