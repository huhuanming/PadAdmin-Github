require "rails_helper"

RSpec.describe PadsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pads").to route_to("pads#index")
    end

    it "routes to #new" do
      expect(:get => "/pads/new").to route_to("pads#new")
    end

    it "routes to #show" do
      expect(:get => "/pads/1").to route_to("pads#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pads/1/edit").to route_to("pads#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pads").to route_to("pads#create")
    end

    it "routes to #update" do
      expect(:put => "/pads/1").to route_to("pads#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pads/1").to route_to("pads#destroy", :id => "1")
    end

  end
end
