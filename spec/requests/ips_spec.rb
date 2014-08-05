require 'rails_helper'

RSpec.describe "Ips", :type => :request do
  describe "GET /ips" do
    it "works! (now write some real specs)" do
      get ips_path
      expect(response.status).to be(200)
    end
  end
end
