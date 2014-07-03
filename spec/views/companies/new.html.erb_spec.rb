require 'rails_helper'

RSpec.describe "companies/new", :type => :view do
  before(:each) do
    assign(:company, Company.new(
      :admin_user_id => "MyString",
      :company_name => "MyString",
      :company_address => "MyString",
      :company_tel => "MyString"
    ))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do

      assert_select "input#company_admin_user_id[name=?]", "company[admin_user_id]"

      assert_select "input#company_company_name[name=?]", "company[company_name]"

      assert_select "input#company_company_address[name=?]", "company[company_address]"

      assert_select "input#company_company_tel[name=?]", "company[company_tel]"
    end
  end
end
