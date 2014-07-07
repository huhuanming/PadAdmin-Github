# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_user do
  	username "admin"
    email "admin@example.com"
    password "MyStringdfaffaddfafadafafafa"
    password_confirmation "MyStringdfaffaddfafadafafafa"
  end
end
