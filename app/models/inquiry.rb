class Inquiry
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :message

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, :presence => true
  validates :email, :presence => true,
            :format => { with: VALID_EMAIL_REGEX }
  validates :message, :presence => true,
            :length => { :minimum => 5, :maximum => 1000 }


  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def deliver
    return false unless valid?
    true
  end

  def persisted?
    false
  end
end