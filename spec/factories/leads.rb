# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lead do
    name "MyString"
    phone "MyString"
    email "MyString"
    zip "MyString"
    wants_doors false
    wants_windows false
  end
end
