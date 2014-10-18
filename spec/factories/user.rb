# This will guess the User class
FactoryGirl.define do
  factory :user do
    email "test@test.ru"
    password "password"
    admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email "admin@test.ru"
    password "administrator"
    admin true
  end
end