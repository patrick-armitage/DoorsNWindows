class UserMailer < ActionMailer::Base
  default from: ENV['AWS_EMAIL_SALES']

  def new_lead_notice(lead)
    @lead = lead

    User.all.each do |user|
      @user = user
      mail to: @user.email, subject: "New Lead: #{ @lead.name }"
    end
  end

  def new_inquiry_notice(inquiry)
    @inquiry = inquiry

    User.all.each do |user|
      @user = user
      mail to: @user.email, subject: "Inquiry received from: #{ @inquiry.email }"
    end
  end
end
