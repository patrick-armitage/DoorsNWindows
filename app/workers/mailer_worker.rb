class MailerWorker
  include Sidekiq::Worker
  # sidekiq_options queue: "high"
  # sidekiq_options retry: false

  def perform(lead_id)
    lead = Lead.find(lead_id)

    LeadMailer.request_received(lead).deliver
    UserMailer.new_lead_notice(lead).deliver
  end
end