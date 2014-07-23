require "rails_helper"

RSpec.describe PluginsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/plugins").to route_to("plugins#index")
    end

    it "routes to #new" do
      expect(:get => "/plugins/new").to route_to("plugins#new")
    end

    it "routes to #show" do
      expect(:get => "/plugins/1").to route_to("plugins#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/plugins/1/edit").to route_to("plugins#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/plugins").to route_to("plugins#create")
    end

    it "routes to #update" do
      expect(:put => "/plugins/1").to route_to("plugins#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/plugins/1").to route_to("plugins#destroy", :id => "1")
    end

  end
end
