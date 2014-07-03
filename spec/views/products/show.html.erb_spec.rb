require 'rails_helper'

RSpec.describe "products/show", :type => :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :company_id => "Company",
      :product_name => "Product Name",
      :context => "Context"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/Product Name/)
    expect(rendered).to match(/Context/)
  end
end
