require 'spec_helper'

describe Project do

	let(:user) { FactoryGirl.create(:user) }

	before do
		@project = user.projects.build(name: "Test", repository_url: "git@github.com:wtsnz/railstut.git")
	end

	subject { @project }

	it { should respond_to(:name) }
	it { should respond_to(:repository_url) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	
	its(:user) { should eq user }

	it { should be_valid }

	describe "when user_id is not present" do
		before { @project.user_id = nil }
		it { should_not be_valid }
	end



end