require "rails_helper"

RSpec.describe IpsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ips").to route_to("ips#index")
    end

    it "routes to #new" do
      expect(:get => "/ips/new").to route_to("ips#new")
    end

    it "routes to #show" do
      expect(:get => "/ips/1").to route_to("ips#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ips/1/edit").to route_to("ips#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/ips").to route_to("ips#create")
    end

    it "routes to #update" do
      expect(:put => "/ips/1").to route_to("ips#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ips/1").to route_to("ips#destroy", :id => "1")
    end

  end
end
