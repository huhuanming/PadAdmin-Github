require 'rails_helper'

RSpec.describe "products/edit", :type => :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :product_name => "MyString",
      :context => "MyString",
      :create_at => "MyString",
      :update_at => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input#product_product_name[name=?]", "product[product_name]"

      assert_select "input#product_context[name=?]", "product[context]"

      assert_select "input#product_create_at[name=?]", "product[create_at]"

      assert_select "input#product_update_at[name=?]", "product[update_at]"
    end
  end
end
