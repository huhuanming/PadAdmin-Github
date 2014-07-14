require 'rails_helper'

RSpec.describe "pads/new", :type => :view do
  before(:each) do
    assign(:pad, Pad.new(
      :MAC_address => "MyString"
    ))
  end

  it "renders new pad form" do
    render

    assert_select "form[action=?][method=?]", pads_path, "post" do

      assert_select "input#pad_MAC_address[name=?]", "pad[MAC_address]"
    end
  end
end
