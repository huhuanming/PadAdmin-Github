require 'rails_helper'

RSpec.describe "informs/show", :type => :view do
  before(:each) do
    @inform = assign(:inform, Inform.create!(
      :company_id => "Company",
      :title => "Title",
      :author => "Author",
      :context => "Context"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Context/)
  end
end
