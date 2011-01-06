require "test_helper"

describe Occi::Storage do
  describe "#all" do
    it "returns a parsed XML document" do
      VCR.use_cassette "storages_get" do
        response = Connection.network.all

        is_okay response
      end
    end
  end

  describe "#create" do
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
        response = Connection.storage.create @upload

        is_created response
      end
    end
  end
end
