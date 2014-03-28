require "spec_helper"

describe MailerWorker do
  let(:lead) { FactoryGirl.create(:lead) }

  it "should send new job to Sidekiq" do

    # let(:user) { FactoryGirl.create(:user, receive_notifications: true) }
    MailerWorker.perform_async(lead.id)
    expect(MailerWorker).to have(1).jobs

    expect{
        # forces the execution of all enqueued jobs in this queue
        MailerWorker.clear
    }.to change{MailerWorker.jobs.size}.from(1).to(0)

    # expect{
    #     Sidekiq::Extensions::DelayedMailer.drain
    # }.to change{ActionMailer::Base.deliveries.count}.by 5
  end
end
