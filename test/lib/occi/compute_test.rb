require "test_helper"

describe Occi::Compute do
  describe "#all" do
    #it "returns a parsed XML document" do
    #  VCR.use_cassette "compute_all" do
    #    response = Connection.compute.all

    #    is_okay response
    #  end
    #end
  end

  describe "#create" do
    before do
      ##
      # Adding NETWORK_NAME to the CONTEXT should be reworked.
      # We want the vm to divine it's IP from its MAC Address on
      # boot.  Then we no longer need the coupling in the XML.
      # CLOUD-35 open to address this.

      @builder = Nokogiri::XML::Builder.new do
        COMPUTE {
          NAME "Test Framework"
          INSTANCE_TYPE "small"
          DISK {
            STORAGE(:href => "http://www.opennebula.org/storage/11")
          }
          NIC {
            NETWORK(:href => "http://www.opennebula.org/network/25")
          }
          CONTEXT {
            NETWORK_NAME "10.3.172.0"
          }
        }
      end.to_xml
    end

    it "returns a parsed XML document" do
      VCR.use_cassette "compute_create" do
        response = Connection.compute.create @builder

        is_created response
      end
    end
  end

  describe "#find" do
    it "returns a parsed XML document" do
      id = cassette_for("compute_create").xpath('//ID').text

      VCR.use_cassette "compute_find" do
        response = Connection.compute.find id

        is_okay response
      end
    end
  end

  describe "#destroy" do
    it "returns a parsed XML document" do
      id = cassette_for("compute_create").xpath('//ID').text

      VCR.use_cassette "compute_destroy" do
        response = Connection.compute.destroy id

        is_no_content response
      end
    end
  end

  describe "#update" do
    before do
      @builder = Nokogiri::XML::Builder.new do
        COMPUTE {
          STATE "shutdown"
        }
      end.to_xml
    end

    it "returns a parsed XML document" do
      id = cassette_for("compute_create").xpath('//ID').text

      VCR.use_cassette "compute_update" do
        response = Connection.compute.update id, @builder

        is_accepted response
      end
    end
  end
end
