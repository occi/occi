require "support"

def magic
  @magic ||= [
    cassette_for("computes_post"),
    cassette_for("networks_post"),
    cassette_for("storages_post")
  ].map { |ele| ele.xpath('//ID').text }
end

describe Occi::Entity do
  Occi::Entity::Gets.each_with_index do |method, i|
    describe "#{method}/#{magic[i]}" do

      it "returns a parsed XML document" do
        VCR.use_cassette method do
          response = Connection.send method, magic[i]

          is_okay response
        end
      end
    end
  end

  describe "#compute_put/#{magic[0]}" do
    before do
      @builder = Nokogiri::XML::Builder.new do
        COMPUTE {
          STATE "shutdown"
        }
      end.to_xml
    end

    it "returns a parsed XML document" do
      VCR.use_cassette "compute_put" do
        response = Connection.compute_put magic[1], :body => @builder

        is_accepted response
      end
    end
  end

  #Occi::Entity::Deletes.each_with_index do |method, i|
  #  describe "#{method}/#{Magic[i]}" do

  #    it "returns a parsed XML document" do
  #      VCR.use_cassette method do
  #        response = Connection.send method, Magic[i]

  #        is_no_content response
  #      end
  #    end
  #  end
  #end
end
