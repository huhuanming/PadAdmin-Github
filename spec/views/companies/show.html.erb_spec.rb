require 'rails_helper'

RSpec.describe "companies/show", :type => :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :admin_user_id => "Admin User",
      :company_name => "Company Name",
      :company_address => "Company Address",
      :company_tel => "Company Tel"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Admin User/)
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Company Address/)
    expect(rendered).to match(/Company Tel/)
  end
end
