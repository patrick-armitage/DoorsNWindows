require 'spec_helper'

describe ActivitiesController do

  describe "GET 'index'" do
    let(:user) { FactoryGirl.create(:user) }
    before { sign_in user, no_capybara: true }
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
