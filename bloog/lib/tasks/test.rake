require 'rake/testtask'

task default: %w[test]

Rake::TestTask.new do |t|
  t.test_files = FileList['app/**/*_spec.rb']
  t.verbose = true
end