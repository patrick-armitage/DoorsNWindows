class LeadMailer < ActionMailer::Base
  default from: ENV['DEFAULT_FROM_EMAIL']

  def request_received(lead)
    @lead = lead

    mail to: @lead.email, subject: "Quote Request Confirmation"
  end
end
