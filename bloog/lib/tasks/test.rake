require 'rake/testtask'

namespace 'test' do |_|
  unit_test_files = FileList['app/models/*_spec.rb']

  desc "Run unit tests"
  Rake::TestTask.new('unit') do |t|
    t.test_files = unit_test_files
    t.verbose = true
  end
end
