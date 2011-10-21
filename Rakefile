require 'rake'
require 'rspec/core/rake_task'

desc 'Default: run unit tests.'
task :default => :spec

desc 'Run all specs under spec/*_spec.rb'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ["-c", "-f progress"]
  t.pattern = "spec/*_spec.rb"
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "forward_amazonmws"
    gemspec.summary = "A Ruby Wrapper for the Amazon MWS API"
    gemspec.description = "A Ruby Wrapper for the Amazon MWS API"
    gemspec.email = "david.michael@sonymusic.com"
    gemspec.homepage = "http://github.com/forward/amazon-mws"
    gemspec.authors = ["David Michael"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available"
end
