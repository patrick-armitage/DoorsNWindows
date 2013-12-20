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
        @lead.create_activity :create, owner: current_user
        flash[:success] = "New Quote Available."
        redirect_to leads_path
      else
        @lead.create_activity :new
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
    @lead.assign_attributes(lead_params)
    changes = @lead.changes

    respond_to do |format|
      if @lead.save
        @lead.create_activity :update, owner: current_user, params: changes
        format.html { render action: "index" }
        format.js   {}
        format.json { render json: @lead, status: :updated, location: @lead }
      else
        format.html { render action: "index" }
        format.js   {}
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lead = Lead.find(params[:id])
    @id = @lead.id

    respond_to do |format|
      if @lead.destroy
        @lead.create_activity :delete, owner: current_user
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
                                   :interest, :status, :notes)
    end

    def activity_params(model)
      model.changed.each do |change|
        params[change]
      end
    end
end
