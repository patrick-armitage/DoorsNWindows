class LandingPagesController < ApplicationController
  layout 'landing_page'

  def doors
    @landinglead = Lead.new
  end

  def windows
    @landinglead = Lead.new
  end

  def create
    @landinglead = Lead.new(lead_params)
    if @landinglead.save
      MailerWorker.perform_async(@landinglead.id)
      @landinglead.create_activity :create, owner: signed_in? ? current_user : nil, params: @landinglead.attributes
      render :doors
    end
  end

  private
    def lead_params
      params.require(:landinglead).permit(:name, :phone, :email, :zip,
                                   :interest, :status, :notes)
    end
end
