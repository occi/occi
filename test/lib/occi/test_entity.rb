require "support"

describe Occi::Entity do
  Magic_Ids = [
    cassette_for("computes_post"),
    cassette_for("networks_post"),
    cassette_for("storages_post")
  ].map { |ele| ele.xpath('//ID').text }

  Occi::Entity::Gets[:methods].each_with_index do |method, i|
    describe "#{method}/#{Magic_Ids[i]}" do

      it "returns a parsed XML document" do
        VCR.use_cassette method do
          response = Connection.send method, Magic_Ids[i]

          is_okay response
        end
      end
    end
  end

  Occi::Entity::Deletes[:methods].each_with_index do |method, i|
    describe "#{method}/#{Magic_Ids[i]}" do

      it "returns a parsed XML document" do
        VCR.use_cassette method do
          response = Connection.send method, Magic_Ids[i]

          is_no_content response
        end
      end
    end
  end

  Magic_Vm = "134"
  describe "#compute_put/#{Magic_Vm}" do
    before do
      @builder = Nokogiri::XML::Builder.new do
        COMPUTE {
          STATE "shutdown"
        }
      end.to_xml
    end

    it "returns a parsed XML document" do
      VCR.use_cassette "compute_put" do
        response = Connection.compute_put Magic_Vm, :body => @builder

        is_accepted response
      end
    end
  end
end
