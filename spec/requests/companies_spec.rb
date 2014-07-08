require 'rails_helper'

RSpec.describe "Companies", :type => :request do
  describe "GET /companies" do
    it "works!" do
      get companies_path
      expect(response.status).to be(302)
      expect(response).to redirect_to(new_admin_user_session_path)
    end
  end
end
