require 'rails_helper'

RSpec.describe "plugins/edit", :type => :view do
  before(:each) do
    @plugin = assign(:plugin, Plugin.create!())
  end

  it "renders the edit plugin form" do
    render

    assert_select "form[action=?][method=?]", plugin_path(@plugin), "post" do
    end
  end
end
