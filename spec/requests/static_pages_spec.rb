require 'spec_helper'

describe "Static Pages" do

	subject { page }

	describe "Homepage" do

		before { visit root_path }

		it { should have_content('Say Hello to Carson') }
		it { should have_title(full_title('')) }

	end

	describe "Help page" do

		before { visit help_path }

		it { should have_content('Help') }
		it { should have_title(full_title('Help')) }

	end

	describe "About page" do

		before { visit about_path }

		it { should have_content('About Us') }
		it { should have_title(full_title('About')) }

	end

end
