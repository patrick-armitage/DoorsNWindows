FactoryGirl.define do
  factory :inquiry do
    name "John Customer"
    email "john@customers.com"
    subject "test subject"
    message "test message longer than 10 chars"
  end
end
