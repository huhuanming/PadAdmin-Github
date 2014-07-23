require 'rails_helper'

RSpec.describe "plugins/show", :type => :view do
  before(:each) do
    @plugin = assign(:plugin, Plugin.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
