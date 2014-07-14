require 'rails_helper'


RSpec.describe "PushMessages", :type => :request do
  describe "GET /push_messages" do
    it "works! (now write some real specs)" do
      get push_messages_path
      expect(response.status).to be(302)
      expect(response).to redirect_to(new_admin_user_session_path)
    end
  end
end
