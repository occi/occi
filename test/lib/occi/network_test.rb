require "test_helper"

describe Occi::Network do
  describe "#all" do
    it "returns a parsed XML document" do
      VCR.use_cassette "networks_get" do
        response = Connection.network.all

        is_okay response
      end
    end
  end

  describe "#create" do
    before do
      @builder = Nokogiri::XML::Builder.new do
        NETWORK {
          NAME "Test Framework"
          ADDRESS "192.168.1.1"
          SIZE "200"
        }
      end.to_xml
    end

    it "returns a parsed XML document" do
      VCR.use_cassette "networks_post" do
        response = Connection.network.create @builder

        is_created response
      end
    end
  end
end
