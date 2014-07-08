# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    company_id 1
    product_name "MyString"
    context "MyString"
  end
end
