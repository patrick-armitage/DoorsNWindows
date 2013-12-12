# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lead do
    name "John Customer"
    phone "123-456-7890"
    email "john@customers.com"
    zip "12345"
    interest "Both"
  end
end
