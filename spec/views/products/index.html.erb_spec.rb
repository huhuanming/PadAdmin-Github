require 'rails_helper'

RSpec.describe "products/index", :type => :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :company_id => "Company",
        :product_name => "Product Name",
        :context => "Context"
      ),
      Product.create!(
        :company_id => "Company",
        :product_name => "Product Name",
        :context => "Context"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "Product Name".to_s, :count => 2
    assert_select "tr>td", :text => "Context".to_s, :count => 2
  end
end
