namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Faker::Config.locale = :en_us
    100.times do |n|
      name     = Faker::Name.name
      phone    = Faker::PhoneNumber.phone_number.gsub(/[^0-9]/i, '')[0..9]
      email    = Faker::Internet.email
      zip      = Faker::Address.zip_code.gsub(/[^0-9]/i, '')[0..4]
      interest = ['Doors', 'Windows', 'Both'].sample
      Lead.create!(name: name,
                   phone: phone,
                   email: email,
                   zip: zip,
                   interest: interest)
    end
  end
end