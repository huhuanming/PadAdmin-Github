require 'rails_helper'

RSpec.describe "Pads", :type => :request do
	describe "GET /pads" do

		it "should show register link if user not signed in" do
			get pads_path
			expect(response.status).to be(302)
			expect(response).to redirect_to(new_admin_user_session_path)
		end
	end
end
