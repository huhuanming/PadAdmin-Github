# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inform do
    company_id 1
    title "MyString"
    author "MyString"
    context "MyText"
  end
end
