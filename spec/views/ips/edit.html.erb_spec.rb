require 'rails_helper'

RSpec.describe "ips/edit", :type => :view do
  before(:each) do
    @ip = assign(:ip, Ip.create!(
      :user_name => "MyString",
      :IP_address => "MyString"
    ))
  end

  it "renders the edit ip form" do
    render

    assert_select "form[action=?][method=?]", ip_path(@ip), "post" do

      assert_select "input#ip_user_name[name=?]", "ip[user_name]"

      assert_select "input#ip_IP_address[name=?]", "ip[IP_address]"
    end
  end
end
