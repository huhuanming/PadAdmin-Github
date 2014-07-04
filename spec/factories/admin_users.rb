# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do
    email "admin@example.com"
    encrypted_password "MyStringdfaffaddfafadafafafa"
    username "admin"
  end
end
