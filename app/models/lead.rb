class Lead < ActiveRecord::Base
  include LeadsHelper

  before_save do
    self.name = name.titleize
    self.phone = phone.gsub(/[^0-9]/i, '')
    self.email = email.downcase
    self.zip = zip.gsub(/[^0-9]/i, '')
  end

  #bootstrap-will_paginate
  self.per_page = 12

  VALID_PHONE_REGEX = /\A\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_ZIP_REGEX   = /\A\d{5}\z/

  validates :name, :phone, :email, :zip, :interest, :status, presence: true, allow_blank: false
  validates :name,  length: { maximum: 50 }
  validates :phone, format: { with: VALID_PHONE_REGEX }
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :zip,   format: { with: VALID_ZIP_REGEX }, length: { maximum: 5 }
  validates_inclusion_of :interest, :in => :lead_interests
  validates_inclusion_of :status, :in => :lead_status_options

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def log!
    Log.create! :start_time => Time.now, :finish_time => Time.now, :message => self.errors.full_messages.to_s, :success => "N" if self.errors.count > 0
  end
end
