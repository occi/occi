require "support"

describe Occi::Networks do
  describe "#networks_get" do
    it "returns a parsed XML document" do
      ::VCR.use_cassette "networks_get" do
        response = Connection.networks_get

        response.must_be_kind_of ::Nokogiri::XML::Document
      end
    end
  end
end
