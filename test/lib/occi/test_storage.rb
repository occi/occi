require "support"

#describe Occi::Storages do
  describe "#storages_get" do
    it "returns a parsed XML document" do
      VCR.use_cassette "storages_get" do
        response = Connection.storages_get

        response.must_be_kind_of Nokogiri::XML::Document
      end
    end
  end
#end
