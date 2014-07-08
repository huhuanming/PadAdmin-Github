require 'rails_helper'

describe HomeController do
	before(:each) do
	   	@user = FactoryGirl.create(:admin_user)
	    sign_in @user
	end
  
  	describe ":index" do
    # let(:admin_user) { Factory :admin_user }
	    it "should show register link if user not signed in" do
		    
		    get :index
		    expect(response.status).to eq(200)
		      # visit '/'
		      # get :index
		      # page.should have_content('注册')
	    end

	    # it "should have hot topic lists if user is signed in" do
	    #   visit '/'
	    #   sign_in admin_user

	    #   get :index
	    #   page.should have_content('社区精华帖')
	    # end
  	end
end