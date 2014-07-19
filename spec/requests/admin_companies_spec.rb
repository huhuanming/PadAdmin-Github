require 'rails_helper'

RSpec.describe "AdminCompanies", :type => :request do
  describe "GET /admin_companies" do
    it "works! (now write some real specs)" do
      get admin_companies_path
      expect(response.status).to be(200)
    end
  end
end
