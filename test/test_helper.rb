require "bundler"
Bundler.setup :default, :test

%w(minitest/autorun minitest/spec nokogiri vcr webmock occi).each { |r| require r }

class MiniTest::Unit::TestCase
  Connection = Occi::Client.new(
    :host     => "one.example.com",
    :user     => ENV['ONE_USER'],
    :password => ENV['ONE_PASSWORD'],
  )

  def okay response, code
    response.body.must_be_kind_of Nokogiri::XML::Document
    response.code.must_equal code
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
  c.default_cassette_options = { :record => :new_episodes }
end

MiniTest::Unit.autorun
