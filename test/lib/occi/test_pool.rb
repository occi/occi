require "support"

describe Occi::Pool do
  %w(computes_get storages_get networks_get).each do |method|
    describe "#{method}" do
      it "returns a parsed XML document" do
        VCR.use_cassette method do
          response = Connection.send method

          response.body.must_be_kind_of Nokogiri::XML::Document
        end
      end
    end
  end

  describe "#networks_post" do
    before do
      @builder = Nokogiri::XML::Builder.new do
        NETWORK {
          NAME "My Service Network"
          ADDRESS "192.168.1.1"
          SIZE "200"
        }
      end
    end

    it "returns a parsed XML document" do
      VCR.use_cassette "networks_post" do
        response = Connection.networks_post :body => @builder.to_xml

        response.body.must_be_kind_of Nokogiri::XML::Document
        response.code.must_equal "201"
      end
    end
  end
end
