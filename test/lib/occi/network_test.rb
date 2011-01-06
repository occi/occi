require "test_helper"

describe Occi::Network do
  describe "#all" do
    it "returns a parsed XML document" do
      VCR.use_cassette "network_all" do
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
      VCR.use_cassette "network_create" do
        response = Connection.network.create @builder

        is_created response
      end
    end
  end

  describe "#find" do
    it "returns a parsed XML document" do
      id = cassette_for("network_create").xpath('//ID').text

      VCR.use_cassette "network_find" do
        response = Connection.network.find id

        is_okay response
      end
    end
  end

  describe "#delete" do
    it "returns a parsed XML document" do
      id = cassette_for("network_create").xpath('//ID').text

      VCR.use_cassette "network_delete" do
        response = Connection.network.delete id

        is_no_content response
      end
    end
  end
end
