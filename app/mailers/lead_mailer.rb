class LeadMailer < ActionMailer::Base
  default from: ENV['AWS_EMAIL_SALES']

  def request_received(lead)
    @lead = lead

    mail to: @lead.email, subject: "Quote Request Confirmation"
  end
end
