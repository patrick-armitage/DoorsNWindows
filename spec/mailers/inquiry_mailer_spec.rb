require "spec_helper"

describe InquiryWorker do
  let(:inquiry) { FactoryGirl.build(:inquiry) }

  it "should send new job to Sidekiq" do

    # let(:user) { FactoryGirl.create(:user, receive_notifications: true) }
    InquiryWorker.perform_async(inquiry)
    expect(InquiryWorker).to have(1).jobs

    expect{
        # forces the execution of all enqueued jobs in this queue
        InquiryWorker.clear
    }.to change{InquiryWorker.jobs.size}.from(1).to(0)

    # expect{
    #     Sidekiq::Extensions::DelayedMailer.drain
    # }.to change{ActionMailer::Base.deliveries.count}.by 1
  end
end
