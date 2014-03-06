class LeadMailer < ActionMailer::Base
  # default from: "no-reply@doorsnwindows.com"

  def request_received(lead)
    @lead = lead

    mail to: @lead.email, subject: "Quote Request Confirmation"
  end
end
