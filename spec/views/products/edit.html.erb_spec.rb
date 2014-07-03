require 'rails_helper'

RSpec.describe "products/edit", :type => :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :company_id => "MyString",
      :product_name => "MyString",
      :context => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input#product_company_id[name=?]", "product[company_id]"

      assert_select "input#product_product_name[name=?]", "product[product_name]"

      assert_select "input#product_context[name=?]", "product[context]"
    end
  end
end
