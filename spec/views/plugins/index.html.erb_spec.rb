require 'rails_helper'

RSpec.describe "plugins/index", :type => :view do
  before(:each) do
    assign(:plugins, [
      Plugin.create!(),
      Plugin.create!()
    ])
  end

  it "renders a list of plugins" do
    render
  end
end
