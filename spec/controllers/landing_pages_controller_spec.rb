require 'spec_helper'

describe LandingLeadsController do

  describe "GET 'savings'" do
    it "returns http success" do
      get 'savings'
      response.should be_success
    end
  end

end
