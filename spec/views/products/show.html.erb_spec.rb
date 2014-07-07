require 'rails_helper'

RSpec.describe "products/show", :type => :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :product_name => "Product Name",
      :context => "Context",
      :create_at => "Create At",
      :update_at => "Update At"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Product Name/)
    expect(rendered).to match(/Context/)
    expect(rendered).to match(/Create At/)
    expect(rendered).to match(/Update At/)
  end
end
