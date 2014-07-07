require 'rails_helper'

RSpec.describe "products/index", :type => :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :product_name => "Product Name",
        :context => "Context",
        :create_at => "Create At",
        :update_at => "Update At"
      ),
      Product.create!(
        :product_name => "Product Name",
        :context => "Context",
        :create_at => "Create At",
        :update_at => "Update At"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Product Name".to_s, :count => 2
    assert_select "tr>td", :text => "Context".to_s, :count => 2
    assert_select "tr>td", :text => "Create At".to_s, :count => 2
    assert_select "tr>td", :text => "Update At".to_s, :count => 2
  end
end
