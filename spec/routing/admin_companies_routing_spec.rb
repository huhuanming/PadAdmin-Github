require "rails_helper"

RSpec.describe AdminCompaniesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin_companies").to route_to("admin_companies#index")
    end

    it "routes to #new" do
      expect(:get => "/admin_companies/new").to route_to("admin_companies#new")
    end

    it "routes to #show" do
      expect(:get => "/admin_companies/1").to route_to("admin_companies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin_companies/1/edit").to route_to("admin_companies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin_companies").to route_to("admin_companies#create")
    end

    it "routes to #update" do
      expect(:put => "/admin_companies/1").to route_to("admin_companies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin_companies/1").to route_to("admin_companies#destroy", :id => "1")
    end

  end
end
