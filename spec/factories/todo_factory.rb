FactoryGirl.define do
  factory :todo do
    sequence(:title) { |n| "Create a todo app -#{n}" } 
    status 0
  end
end