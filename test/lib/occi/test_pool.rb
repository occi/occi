require "support"

describe Occi::Pool do
  Occi::Pool::Gets.each do |method|
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
          NAME "Test Framework"
          ADDRESS "192.168.1.1"
          SIZE "200"
        }
      end.to_xml
    end

    it "returns a parsed XML document" do
      VCR.use_cassette "networks_post" do
        response = Connection.networks_post :body => @builder

        response.body.must_be_kind_of Nokogiri::XML::Document
        response.code.must_equal "201"
      end
    end
  end

  describe "#storages_post" do
    describe "image upload" do
      before do
        @builder = Nokogiri::XML::Builder.new do
          STORAGE {
            NAME "Test Framework"
            DESCRIPTION "Test Framework Image."
            TYPE "OS"
            ### Not exactly sure what URL does.
            URL "file:///dev/null"
          }
        end.to_xml

        @upload = {
          :parts => {
            :file    => "/dev/null",
            :occixml => @builder,
          },
          :content_type => "application/octet-stream"
        }
      end

      it "returns a parsed XML document" do
        VCR.use_cassette "storages_post" do
          response = Connection.storages_post :upload => @upload

          response.body.must_be_kind_of Nokogiri::XML::Document
          response.code.must_equal "201"
        end
      end
    end
  end
end
