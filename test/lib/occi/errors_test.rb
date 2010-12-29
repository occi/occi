require "test_helper"

describe Occi::Errors do
  describe Occi::Entity do
    describe "validate" do
      it "raises when status code differs from expected" do
        VCR.use_cassette "invalid_status_entity" do
          lambda { Connection.compute_get 666 }.must_raise Occi::Errors::HTTPStatusError
        end
      end
    end
  end

  describe Occi::Pool do
    describe "validate" do
      it "raises when status code differs from expected" do
        VCR.use_cassette "invalid_status_pool" do
          lambda { Connection.computes_post }.must_raise Occi::Errors::HTTPStatusError
        end
      end
   end
  end
end
