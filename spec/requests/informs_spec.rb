require 'rails_helper'

RSpec.describe "Informs", :type => :request do
  describe "GET /informs" do
    it "works! (now write some real specs)" do
      get informs_path
      expect(response.status).to be(200)
    end
  end
end
