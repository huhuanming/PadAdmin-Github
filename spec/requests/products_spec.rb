require 'rails_helper'

RSpec.describe "Products", :type => :request do
  describe "GET /products" do
    it "works!" do
      get products_path
      expect(response.status).to be(302)
      expect(response).to redirect_to(new_admin_user_session_path)
    end
  end
end
