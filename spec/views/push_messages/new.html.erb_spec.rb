require 'rails_helper'

RSpec.describe "push_messages/new", :type => :view do
  before(:each) do
    assign(:push_message, PushMessage.new(
      :message => "MyString"
    ))
  end

  it "renders new push_message form" do
    render

    assert_select "form[action=?][method=?]", push_messages_path, "post" do

      assert_select "input#push_message_message[name=?]", "push_message[message]"
    end
  end
end
