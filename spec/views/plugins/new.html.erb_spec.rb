require 'rails_helper'

RSpec.describe "plugins/new", :type => :view do
  before(:each) do
    assign(:plugin, Plugin.new())
  end

  it "renders new plugin form" do
    render

    assert_select "form[action=?][method=?]", plugins_path, "post" do
    end
  end
end
