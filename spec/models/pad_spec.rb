require 'rails_helper'

RSpec.describe Pad, :type => :model do
	before { @pad = Pad.new(Mac_address: "12:23:aa:12:11:21" , pad_user_name: "abc") }

	subject { @pad }

	it { should respond_to(:Mac_address) }

	it { should be_valid }

	describe "when Mac_address is not present " do 
		before { @pad.Mac_address = ""}
		it { should_not be_valid}
	end

	describe "when Mac_address is too long or too short " do 
		before { @pad.Mac_address = "aa"}
		it { should_not be_valid}
	end

	describe "when Mac_address is already taken" do
		before do
			pad_with_same_MAC = @pad.dup
			pad_with_same_MAC.Mac_address = @pad.Mac_address.upcase
			pad_with_same_MAC.save 
		end
		it { should_not be_valid }
	end
	describe "when pad_user_name is not present" do 
		before do 
			@pad.pad_user_name = ""
			@pad.save
		end
		it { should be_valid}
	end
	describe "when pad_user_name is present" do 
		before do
			@pad.save
		end
		it { should be_valid}
	end
end
