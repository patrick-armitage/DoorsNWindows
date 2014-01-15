class InquiryWorker
  include Sidekiq::Worker
  # sidekiq_options queue: "high"
  # sidekiq_options retry: false

  def perform(inquiry)
    UserMailer.new_inquiry_notice(inquiry).deliver
  end
end