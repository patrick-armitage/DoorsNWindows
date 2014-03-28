require 'spec_helper'

describe "StaticPages" do
	subject { page }

  describe "Home page" do
  	before { visit root_path }

    it { should have_content('DoorsNWindows') }
    it { should have_title(full_title('Home')) }
    it { should_not have_title('| About') }
  end

  describe "DoorsNWindows Story page" do
    before { visit about_us_story_path }

    it { should have_content('Story') }
    it { should have_title(full_title('About')) }
  end
end
