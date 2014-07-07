require 'rails_helper'

RSpec.describe "products/new", :type => :view do
  before(:each) do
    assign(:product, Product.new(
      :product_name => "MyString",
      :context => "MyString",
      :create_at => "MyString",
      :update_at => "MyString"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input#product_product_name[name=?]", "product[product_name]"

      assert_select "input#product_context[name=?]", "product[context]"

      assert_select "input#product_create_at[name=?]", "product[create_at]"

      assert_select "input#product_update_at[name=?]", "product[update_at]"
    end
  end
end
