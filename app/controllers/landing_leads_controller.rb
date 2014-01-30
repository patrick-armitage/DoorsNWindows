class LandingLeadsController < ApplicationController
  layout 'landing_page'

  def doors
    @landinglead = LandingLead.new
  end

  def windows
    @landinglead = LandingLead.new
  end

  def create
    @landinglead = LandingLead.new(landing_lead_params)
    if @landinglead.save
      MailerWorker.perform_async(@landinglead.id)
      @landinglead.create_activity :create, owner: signed_in? ? current_user : nil, params: @landinglead.attributes
      render :thank_you
    end
  end

  private
    def landing_lead_params
      params.require(:landing_lead).permit(:name, :phone, :email, :zip,
                                          :interest, :status, :notes)
    end
end
