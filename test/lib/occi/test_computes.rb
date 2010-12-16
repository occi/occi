require "support"

#describe Occi::Computes do
  describe "#computes_get" do
    it "returns a parsed XML document" do
      ::VCR.use_cassette "computes_get" do
        response = Connection.computes_get

        response.must_be_kind_of ::Nokogiri::XML::Document
      end
    end
  end
#end
