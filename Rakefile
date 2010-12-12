require "rubygems"
require "rake"

begin
  require "jeweler"
  Jeweler::Tasks.new do |gem|
    gem.name = "occi"
    gem.summary = %Q{Ruby bindings to Open Cloud Computing Interface (OCCI).}
    gem.email = "john@dewey.ws"
    gem.homepage = "http://github.com/retr0h/occi"
    gem.authors = ["retr0h"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require "rake/testtask"
Rake::TestTask.new(:test) do |test|
  test.libs   << "lib" << "test"
  test.pattern = "test/**/test_*.rb"
  test.verbose = true
end

task :default => :test
