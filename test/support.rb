Bundler.setup :default, :test

require "minitest/spec"
require 'digest/sha1'
require "occi"

class MiniTest::Unit::TestCase
  Connection = Occi::Client.new(
    :host     => "one.example.com",
    :user     => "fake",
    :password => Digest::SHA1.hexdigest("credentials"),
  )
end

require "vcr"
require "webmock"
VCR.config do |c|
  c.stub_with :webmock
  c.cassette_library_dir     = "test/fixtures/cassettes"
  c.default_cassette_options = { :record => :new_episodes }
end

MiniTest::Unit.autorun
