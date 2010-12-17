Bundler.setup :default, :test

%w(minitest/spec digest/sha1 nokogiri occi).each { |r| require r }

class MiniTest::Unit::TestCase
  Connection = Occi::Client.new(
    :host     => "one.example.com",
    :user     => ENV['ONE_USER'],
    :password => Digest::SHA1.hexdigest(ENV['ONE_PASSWORD']),
  )
end

require "vcr"
require "webmock"
WebMock.disable_net_connect! :allow => "one.example.com"
VCR.config do |c|
  c.stub_with :webmock
  c.cassette_library_dir     = "test/fixtures/cassettes"
  c.default_cassette_options = { :record => :new_episodes }
end

MiniTest::Unit.autorun
