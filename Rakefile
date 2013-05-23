require "rake/testtask"
require "bundler/gem_tasks"

task :default => :test

Rake::TestTask.new do |task|
  task.libs += %w( lib test )
  task.name = :test
  task.test_files = FileList['test/*_test.rb']
end
