require 'rails_helper'

RSpec.describe "ips/show", :type => :view do
  before(:each) do
    @ip = assign(:ip, Ip.create!(
      :user_name => "User Name",
      :IP_address => "Ip Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User Name/)
    expect(rendered).to match(/Ip Address/)
  end
end
