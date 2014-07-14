require 'rails_helper'

RSpec.describe "push_messages/show", :type => :view do
  before(:each) do
    @push_message = assign(:push_message, PushMessage.create!(
      :message => "Message"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Message/)
  end
end
