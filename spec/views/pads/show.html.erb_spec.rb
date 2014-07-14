require 'rails_helper'

RSpec.describe "pads/show", :type => :view do
  before(:each) do
    @pad = assign(:pad, Pad.create!(
      :MAC_address => "Mac Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Mac Address/)
  end
end
