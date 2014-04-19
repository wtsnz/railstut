require 'spec_helper'

describe User do
	before { @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar") }

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }

	it { should respond_to(:password_confirmation) }
	it { should respond_to(:remember_token) }
	it { should respond_to(:authenticate) }

	it { should be_valid }

	describe "when name is not present" do
		before { @user.name = " " }
		it { should_not be_valid }
	end

	describe "remember token" do
    	before { @user.save }
    	its(:remember_token) { should_not be_blank }
  	end
end
