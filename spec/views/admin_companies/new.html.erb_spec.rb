require 'rails_helper'

RSpec.describe "admin_companies/new", :type => :view do
  before(:each) do
    assign(:admin_company, AdminCompany.new(
      :company_name => "MyString",
      :company_address => "MyString",
      :company_tel => "MyString"
    ))
  end

  it "renders new admin_company form" do
    render

    assert_select "form[action=?][method=?]", admin_companies_path, "post" do

      assert_select "input#admin_company_company_name[name=?]", "admin_company[company_name]"

      assert_select "input#admin_company_company_address[name=?]", "admin_company[company_address]"

      assert_select "input#admin_company_company_tel[name=?]", "admin_company[company_tel]"
    end
  end
end
