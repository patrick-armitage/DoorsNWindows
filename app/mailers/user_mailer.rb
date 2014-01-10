class UserMailer < ActionMailer::Base
  default from: "info@doorsnwindows.com"

  def new_lead_notice(lead)
    @users = User.all
    @lead = lead

    @users.each do |user|
      @user = user
      mail to: user.email, subject: "New Lead: #{ @lead.name }"
    end
  end
end
