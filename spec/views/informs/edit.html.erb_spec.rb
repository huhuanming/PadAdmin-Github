require 'rails_helper'

RSpec.describe "informs/edit", :type => :view do
  before(:each) do
    @inform = assign(:inform, Inform.create!(
      :company_id => "MyString",
      :title => "MyString",
      :author => "MyString",
      :context => "MyString"
    ))
  end

  it "renders the edit inform form" do
    render

    assert_select "form[action=?][method=?]", inform_path(@inform), "post" do

      assert_select "input#inform_company_id[name=?]", "inform[company_id]"

      assert_select "input#inform_title[name=?]", "inform[title]"

      assert_select "input#inform_author[name=?]", "inform[author]"

      assert_select "input#inform_context[name=?]", "inform[context]"
    end
  end
end
