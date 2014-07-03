require 'rails_helper'

RSpec.describe "informs/new", :type => :view do
  before(:each) do
    assign(:inform, Inform.new(
      :company_id => "MyString",
      :title => "MyString",
      :author => "MyString",
      :context => "MyString"
    ))
  end

  it "renders new inform form" do
    render

    assert_select "form[action=?][method=?]", informs_path, "post" do

      assert_select "input#inform_company_id[name=?]", "inform[company_id]"

      assert_select "input#inform_title[name=?]", "inform[title]"

      assert_select "input#inform_author[name=?]", "inform[author]"

      assert_select "input#inform_context[name=?]", "inform[context]"
    end
  end
end
