require 'rails_helper'

RSpec.describe "Informs", :type => :request do
  describe "GET /informs" do
    it "works! " do
      get informs_path
      expect(response.status).to be(302)
      expect(response).to redirect_to(new_admin_user_session_path)
    end
  end
end
