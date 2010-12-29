# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{occi}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["retr0h"]
  s.date = %q{2010-12-23}
  s.email = %q{john@dewey.ws}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    ".rvmrc",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/occi.rb",
    "lib/occi/client.rb",
    "lib/occi/entity.rb",
    "lib/occi/pool.rb",
    "occi.gemspec",
    "test/fixtures/cassettes/compute_delete.yml",
    "test/fixtures/cassettes/compute_get.yml",
    "test/fixtures/cassettes/compute_put.yml",
    "test/fixtures/cassettes/computes_get.yml",
    "test/fixtures/cassettes/computes_post.yml",
    "test/fixtures/cassettes/network_delete.yml",
    "test/fixtures/cassettes/network_get.yml",
    "test/fixtures/cassettes/networks_get.yml",
    "test/fixtures/cassettes/networks_post.yml",
    "test/fixtures/cassettes/storage_delete.yml",
    "test/fixtures/cassettes/storage_get.yml",
    "test/fixtures/cassettes/storages_get.yml",
    "test/fixtures/cassettes/storages_post.yml",
    "test/lib/occi/test_entity.rb",
    "test/lib/occi/test_pool.rb",
    "test/support.rb"
  ]
  s.homepage = %q{http://github.com/retr0h/occi}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ruby bindings to Open Cloud Computing Interface (OCCI).}
  s.test_files = [
    "test/lib/occi/test_entity.rb",
    "test/lib/occi/test_pool.rb",
    "test/support.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hugs>, ["~> 2.1.0"])
      s.add_runtime_dependency(%q<multipart-post>, ["~> 1.0.1"])
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.4.4"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_development_dependency(%q<webmock>, ["~> 1.6.1"])
      s.add_development_dependency(%q<vcr>, ["~> 1.4.0"])
      s.add_development_dependency(%q<minitest>, ["~> 2.0.0"])
    else
      s.add_dependency(%q<hugs>, ["~> 2.1.0"])
      s.add_dependency(%q<multipart-post>, ["~> 1.0.1"])
      s.add_dependency(%q<nokogiri>, ["~> 1.4.4"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_dependency(%q<webmock>, ["~> 1.6.1"])
      s.add_dependency(%q<vcr>, ["~> 1.4.0"])
      s.add_dependency(%q<minitest>, ["~> 2.0.0"])
    end
  else
    s.add_dependency(%q<hugs>, ["~> 2.1.0"])
    s.add_dependency(%q<multipart-post>, ["~> 1.0.1"])
    s.add_dependency(%q<nokogiri>, ["~> 1.4.4"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
    s.add_dependency(%q<webmock>, ["~> 1.6.1"])
    s.add_dependency(%q<vcr>, ["~> 1.4.0"])
    s.add_dependency(%q<minitest>, ["~> 2.0.0"])
  end
end
