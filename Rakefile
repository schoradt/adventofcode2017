require 'rake/testtask'
require 'rdoc/task'
require 'rubocop/rake_task'

Rake::TestTask.new do |t|
  t.pattern = 'test/test_*.rb'
end

RDoc::Task.new do |rdoc|
  rdoc.main = 'README.md'
  rdoc.rdoc_files.include('README.md', 'lib/*.rb', 'lib/*/*.rb')
  rdoc.rdoc_dir = 'rdoc'
end

desc 'Run RuboCop on the lib directory'
RuboCop::RakeTask.new

