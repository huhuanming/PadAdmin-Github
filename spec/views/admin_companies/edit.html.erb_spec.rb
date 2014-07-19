require 'rails_helper'

RSpec.describe "admin_companies/edit", :type => :view do
  before(:each) do
    @admin_company = assign(:admin_company, AdminCompany.create!(
      :company_name => "MyString",
      :company_address => "MyString",
      :company_tel => "MyString"
    ))
  end

  it "renders the edit admin_company form" do
    render

    assert_select "form[action=?][method=?]", admin_company_path(@admin_company), "post" do

      assert_select "input#admin_company_company_name[name=?]", "admin_company[company_name]"

      assert_select "input#admin_company_company_address[name=?]", "admin_company[company_address]"

      assert_select "input#admin_company_company_tel[name=?]", "admin_company[company_tel]"
    end
  end
end
