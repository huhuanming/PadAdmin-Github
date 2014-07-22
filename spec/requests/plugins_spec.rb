require 'rails_helper'

RSpec.describe "Plugins", :type => :request do
  describe "GET /plugins" do
    it "works! (now write some real specs)" do
      get plugins_path
      expect(response.status).to be(200)
    end
  end
end
