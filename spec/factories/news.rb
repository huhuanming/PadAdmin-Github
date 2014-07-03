# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news, :class => 'New' do
    company_id 1
    title "MyString"
    author "MyString"
    context "MyText"
  end
end
