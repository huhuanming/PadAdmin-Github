require 'rails_helper'

RSpec.describe "push_messages/edit", :type => :view do
  before(:each) do
    @push_message = assign(:push_message, PushMessage.create!(
      :message => "MyString"
    ))
  end

  it "renders the edit push_message form" do
    render

    assert_select "form[action=?][method=?]", push_message_path(@push_message), "post" do

      assert_select "input#push_message_message[name=?]", "push_message[message]"
    end
  end
end
