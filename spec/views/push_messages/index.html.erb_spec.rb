require 'rails_helper'

RSpec.describe "push_messages/index", :type => :view do
  before(:each) do
    assign(:push_messages, [
      PushMessage.create!(
        :message => "Message"
      ),
      PushMessage.create!(
        :message => "Message"
      )
    ])
  end

  it "renders a list of push_messages" do
    render
    assert_select "tr>td", :text => "Message".to_s, :count => 2
  end
end
