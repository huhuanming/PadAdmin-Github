require "rails_helper"

RSpec.describe InformsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/informs").to route_to("informs#index")
    end

    it "routes to #new" do
      expect(:get => "/informs/new").to route_to("informs#new")
    end

    it "routes to #show" do
      expect(:get => "/informs/1").to route_to("informs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/informs/1/edit").to route_to("informs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/informs").to route_to("informs#create")
    end

    it "routes to #update" do
      expect(:put => "/informs/1").to route_to("informs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/informs/1").to route_to("informs#destroy", :id => "1")
    end

  end
end
