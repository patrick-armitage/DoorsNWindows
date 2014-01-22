class LandingPagesController < ApplicationController
  layout 'landing_page'

  def doors
    @lead = Lead.new
  end

  def windows
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      MailerWorker.perform_async(@lead.id)
      @lead.create_activity :create, owner: signed_in? ? current_user : nil, params: @lead.attributes
      render :thank_you
    end
  end

  private
    def lead_params
      params.require(:lead).permit(:name, :phone, :email, :zip,
                                   :interest, :status, :notes)
    end
end
