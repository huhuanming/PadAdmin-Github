require 'rails_helper'

RSpec.describe "ips/index", :type => :view do
  before(:each) do
    assign(:ips, [
      Ip.create!(
        :user_name => "User Name",
        :IP_address => "Ip Address"
      ),
      Ip.create!(
        :user_name => "User Name",
        :IP_address => "Ip Address"
      )
    ])
  end

  it "renders a list of ips" do
    render
    assert_select "tr>td", :text => "User Name".to_s, :count => 2
    assert_select "tr>td", :text => "Ip Address".to_s, :count => 2
  end
end
