class UserMailer < ActionMailer::Base
  default from: ENV['AWS_EMAIL_NOREPLY']

  def new_lead_notice(lead)
    @users = User.all
    @lead = lead

    @users.each do |user|
      @user = user #for haml email template
      mail to: user.email, subject: "New Lead: #{ @lead.name }"
    end
  end

  def new_inquiry_notice(inquiry)
    @users = User.all
    @inquiry = inquiry

    @users.each do |user|
      @user = user
      mail to: user.email, subject: "Inquiry received from: #{ @inquiry.email }"
    end
  end
end
