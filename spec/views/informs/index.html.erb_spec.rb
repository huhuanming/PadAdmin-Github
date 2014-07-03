require 'rails_helper'

RSpec.describe "informs/index", :type => :view do
  before(:each) do
    assign(:informs, [
      Inform.create!(
        :company_id => "Company",
        :title => "Title",
        :author => "Author",
        :context => "Context"
      ),
      Inform.create!(
        :company_id => "Company",
        :title => "Title",
        :author => "Author",
        :context => "Context"
      )
    ])
  end

  it "renders a list of informs" do
    render
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Context".to_s, :count => 2
  end
end
