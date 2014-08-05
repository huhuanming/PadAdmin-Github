require 'rails_helper'

RSpec.describe "ips/new", :type => :view do
  before(:each) do
    assign(:ip, Ip.new(
      :user_name => "MyString",
      :IP_address => "MyString"
    ))
  end

  it "renders new ip form" do
    render

    assert_select "form[action=?][method=?]", ips_path, "post" do

      assert_select "input#ip_user_name[name=?]", "ip[user_name]"

      assert_select "input#ip_IP_address[name=?]", "ip[IP_address]"
    end
  end
end
