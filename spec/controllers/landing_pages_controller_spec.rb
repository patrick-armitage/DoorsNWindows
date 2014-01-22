require 'spec_helper'

describe LandingPagesController do

  describe "GET 'doors'" do
    it "returns http success" do
      get 'doors'
      response.should be_success
    end
  end

  describe "GET 'windows'" do
    it "returns http success" do
      get 'windows'
      response.should be_success
    end
  end

end
