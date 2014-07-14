require 'rails_helper'

RSpec.describe "pads/edit", :type => :view do
  before(:each) do
    @pad = assign(:pad, Pad.create!(
      :MAC_address => "MyString"
    ))
  end

  it "renders the edit pad form" do
    render

    assert_select "form[action=?][method=?]", pad_path(@pad), "post" do

      assert_select "input#pad_MAC_address[name=?]", "pad[MAC_address]"
    end
  end
end
