require "test_helper"

describe Occi::Storage do
  describe "#all" do
    it "returns a parsed XML document" do
      VCR.use_cassette "storage_all" do
        response = CONNECTION.network.all

        is_okay response
      end
    end
  end

  describe "#create" do
    before do
      @xml = Nokogiri::XML::Builder.new do
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
          :occixml => @xml,
        },
        :content_type => "application/octet-stream"
      }
    end

    it "returns a parsed XML document" do
      VCR.use_cassette "storage_create" do
        response = CONNECTION.storage.create @upload

        is_created response
      end
    end
  end

  describe "#find" do
    it "returns a parsed XML document" do
      id = cassette_for("storage_create").xpath('//ID').text

      VCR.use_cassette "storage_find" do
        response = CONNECTION.storage.find id

        is_okay response
      end
    end
  end

  describe "#destroy" do
    it "returns a parsed XML document" do
      id = cassette_for("storage_create").xpath('//ID').text

      VCR.use_cassette "storage_destroy" do
        response = CONNECTION.storage.destroy id

        is_no_content response
      end
    end
  end
end
