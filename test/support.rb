::Bundler.setup :default, :test

require "minitest/spec"
require 'digest/sha1'
require "occi"

class MiniTest::Unit::TestCase
  Connection = ::Occi::Client.new(
    :host     => "controller",
    :user     => "fake",
    :password => Digest::SHA1.hexdigest("credentials"),
  )
end

require "vcr"
require "webmock"
::WebMock.disable_net_connect! :allow => "controller"
::VCR.config do |c|
  c.stub_with :webmock
  c.cassette_library_dir     = "test/fixtures/cassettes"
  c.default_cassette_options = { :record => :new_episodes }
end

::MiniTest::Unit.autorun
