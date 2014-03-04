class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.valid?
      UserMailer.new_inquiry_notice(@inquiry).deliver
      # InquiryWorker.perform_async(@inquiry)
      render :thank_you
    else
      render :new
    end
  end

  private
    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :subject, :message, :errors)
    end
end
