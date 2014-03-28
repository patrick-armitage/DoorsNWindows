FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "name#{n}@factory.com" }
    sequence(:email) {|n| "email#{n}@factory.com" }
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
end