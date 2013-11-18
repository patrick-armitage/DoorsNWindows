require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do

    it "should have the content 'DoorsNWindows'" do
      visit '/static_pages/home'
      expect(page).to have_content('DoorsNWindows')
    end
  end
end
