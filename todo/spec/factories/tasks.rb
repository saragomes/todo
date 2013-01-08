# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "MyString"
    date "2013-01-07 03:44:45"
    done false
    association category
  end
end
