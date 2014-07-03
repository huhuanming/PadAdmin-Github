require 'rails_helper'

RSpec.describe "companies/index", :type => :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :admin_user_id => "Admin User",
        :company_name => "Company Name",
        :company_address => "Company Address",
        :company_tel => "Company Tel"
      ),
      Company.create!(
        :admin_user_id => "Admin User",
        :company_name => "Company Name",
        :company_address => "Company Address",
        :company_tel => "Company Tel"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => "Admin User".to_s, :count => 2
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Company Address".to_s, :count => 2
    assert_select "tr>td", :text => "Company Tel".to_s, :count => 2
  end
end
