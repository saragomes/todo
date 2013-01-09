# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    sequence(:name) {|n| "name_#{n}"}
    date "2013-01-07"
    done false
    category
    user
  end
end
