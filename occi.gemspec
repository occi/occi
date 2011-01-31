# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "occi/version"

Gem::Specification.new do |s|
  s.name        = "occi"
  s.version     = Occi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["John Dewey"]
  s.email       = ["john@dewey.ws"]
  s.homepage    = %q{http://github.com/retr0h/occi}
  s.summary     = %q{Ruby bindings to Open Cloud Computing Interface (OCCI).}

  s.rubyforge_project = "occi"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "hugs", "~> 2.3.0"
  s.add_dependency "multipart-post", "~> 1.0.1"
  s.add_dependency "nokogiri", "~> 1.4.4"

  s.add_development_dependency "rake"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock"
  s.add_development_dependency "minitest"
end
