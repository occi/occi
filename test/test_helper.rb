Bundler.setup :default, :test

require "occi"

require "minitest/spec"
require "nokogiri"
require "vcr"
require "webmock"

class MiniTest::Unit::TestCase
  CONNECTION = Occi::Client.new(
    :host     => "one.example.com",
    :user     => ENV['ONE_USER'],
    :password => ENV['ONE_PASSWORD'],
  )

  def okay response, code
    response.code.must_equal code
    response.body.errors.must_be_empty
  end

  def is_okay response
    okay response, "200"
  end

  def is_accepted response
    okay response, "202"
  end

  def is_no_content response
    okay response, "204"
  end

  def is_created response
    okay response, "201"
  end
end

def cassette_for cassette
  c = VCR::Cassette.new(cassette).send :recorded_interactions

  Nokogiri::XML::Document.parse c.first.response.body
end

WebMock.disable_net_connect! :allow => "one.example.com"
VCR.config do |c|
  c.stub_with :webmock
  c.cassette_library_dir     = "test/fixtures/cassettes"
  c.default_cassette_options = { :record => :none }
end

MiniTest::Unit.autorun
