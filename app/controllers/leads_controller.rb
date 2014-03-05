class LeadsController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :update, :destroy]
  before_action :delete_activity, only: [:destroy]
  # after_action :new_lead_notify, only: [:create]

  def index
    @leads = Lead.reorder(sort_column + " " + sort_direction).paginate(page: params[:page]).search(params[:search], params[:type])
    fresh_when last_modified: @leads.maximum(:updated_at)
    expires_in 5.minutes
  end

  def show
    @lead = Lead.find(params[:id])
    @activities = @lead.activities.paginate(page: params[:page])
    fresh_when @lead, public: true
    expires_in 5.minutes
  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
    @lead.geocode if @lead.valid?

    if @lead.geocoded? && @lead.distance_from(Lead.center_point) < 40
      if @lead.save
        MailerWorker.perform_async(@lead.id)
        if signed_in?
          @lead.create_activity :create, owner: current_user, params: @lead.attributes
          flash[:success] = "#{ current_user.name } successfully created a lead."
          redirect_to leads_path
        else
          @lead.create_activity :new, params: @lead.attributes
          redirect_to thank_you_path
        end
      else #error rerouting
        if request.env["HTTP_REFERER"].to_s.include? 'leads'
          render 'new'
        else
          render 'static_pages/home'
        end
      end
    else
      redirect_to no_service_path
    end
  end

  def update
    @lead = Lead.find(params[:id])
    @lead.assign_attributes(lead_params)
    changes = @lead.changes

    respond_to do |format|
      if @lead.save
        @lead.create_activity :update, owner: current_user, params: changes unless changes.empty?
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
    @name = @lead.name

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
                                   :interest, :status, :notes)
    end

    def delete_activity
      @lead = Lead.find(params[:id])
      @lead.create_activity :delete, owner: current_user, params: @lead.attributes
    end
end
