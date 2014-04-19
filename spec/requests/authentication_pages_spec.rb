require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin" do
    before { visit signin_path }

    it { should have_content('Sign in') }
    it { should have_title('Sign in') }

    describe "with invalid infomation" do
    	before { click_button "Sign in" }

    	it { should have_title "Sign in"}
    	it { should have_selector "div.alert.alert-error" }

    	describe "after visiting another page" do
		  before { click_link "Home" }
		  it { should_not have_selector('div.alert.alert-error') }
		end

    end

  end
end
