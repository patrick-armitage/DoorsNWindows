class LeadsController < ApplicationController
  before_action :signed_in_user, only: [:index, :update, :destroy]

  def index
    @lead = Lead.new
    @leads = Lead.reorder(sort_column + " " + sort_direction).paginate(page: params[:page]).search(params[:search])
  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      if signed_in?
        flash[:success] = "New Quote Available."
        redirect_to leads_path
      else
        flash[:success] = "Your Free Quote request has been received! We will contact you shortly."
        redirect_to root_path
      end
    else
      if request.env["HTTP_REFERER"].to_s.include? 'leads'
        render 'new'
      else
        render 'static_pages/home'
      end
    end
  end

  def update
    @lead = Lead.find(params[:id])

    respond_to do |format|
      if @lead.update_attributes(lead_params)
        format.html { render action: "index" }
        format.js   {}
        format.json { render json: @lead, status: :updated, location: @lead }
      else
        format.html { render action: "index" }
        format.js   {}
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end

    # if @lead.update_attributes(lead_params)
    #   render 'index'
    # else
    #   flash[:error] = "Lead failed to update"
    #   render 'index'
    # end
  end

  def destroy
    @lead = Lead.find(params[:id])
    @id = @lead.id

    respond_to do |format|
      if @lead.destroy
        format.html { render action: "index" }
        format.js   {}
        format.json { render json: @lead, status: :deleted, location: @lead }
      else
        format.html { render action: "index" }
        format.js   {}
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def lead_params
      params.require(:lead).permit(:name, :phone, :email, :zip,
                                   :interest, :status)
    end
end
