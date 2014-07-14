require 'rails_helper'

RSpec.describe "pads/index", :type => :view do
  before(:each) do
    assign(:pads, [
      Pad.create!(
        :MAC_address => "Mac Address"
      ),
      Pad.create!(
        :MAC_address => "Mac Address"
      )
    ])
  end

  it "renders a list of pads" do
    render
    assert_select "tr>td", :text => "Mac Address".to_s, :count => 2
  end
end
