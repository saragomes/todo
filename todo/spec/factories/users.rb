# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "name_#{n}"}
    sequence(:email) {|n| "test_#{n}@test.com"}
    crypted_password "MyString"
    password "MyString"
    password_confirmation "MyString"
    password_salt "MyString"
    sequence(:persistence_token) {|n| "persistence_token_#{n}"}
  end
end
