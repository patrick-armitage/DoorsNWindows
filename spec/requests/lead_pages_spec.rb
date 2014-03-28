require 'spec_helper'

describe "Lead Pages" do

  subject { page }

  describe "Home Page" do
    before { visit root_path }

    describe "for non-signed-in users" do

      describe "with invalid lead info" do

        before { click_button "Free Quote" }

        it { should have_content('FREE Quote') }
        it { should have_selector('div.alert.alert-error', text: 'error') }
      end

      describe "with valid lead info" do

        let(:lead) { FactoryGirl.create(:lead) }
        before { lead_gen lead }

        it { should have_content('FREE Quote') }
        it { should have_selector('div.alert.alert-success', text: 'received') }

      end
    end

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      describe "with valid lead info" do
        let(:lead) { FactoryGirl.create(:lead) }
        before { lead_gen lead }

        it { should have_content('All Leads') }
        it { should have_xpath("//input[@value='" + lead.name + "']") }
        it { should have_selector('div.alert.alert-success', text: 'received') }

      end
    end
  end

  describe "All-Leads Page" do

    describe "for non-signed-in users" do

    end

    describe "for signed-in users" do
    end
  end

end
