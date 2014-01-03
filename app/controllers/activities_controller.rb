class ActivitiesController < ApplicationController
  before_action :signed_in_user, only: [:index]

  def index
    @activities = PublicActivity::Activity.order("created_at desc").paginate(page: params[:page])
  end

  def show
    @activity = PublicActivity::Activity.find(params[:id])
  end
end
