# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :push_target do
    push_message_id 1
    pad_id 1
  end
end
