namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    include ActionView::Helpers::LeadsHelper
    Faker::Config.locale = :en_us
    100.times do |n|
      name     = Faker::Name.name
      phone    = Faker::PhoneNumber.phone_number.gsub(/[^0-9]/i, '')[0..9]
      email    = Faker::Internet.email
      zip      = Faker::Address.zip_code.gsub(/[^0-9]/i, '')[0..4]
      interest = lead_interests.sample
      status   = lead_status_options.sample
      Lead.create!(name: name,
                   phone: phone,
                   email: email,
                   zip: zip,
                   interest: interest,
                   status: status)
    end
  end
end