class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include UsersHelper

  helper_method :sort_column, :sort_direction

  def home
    render 'static_pages/home'
  end

  private

    def sort_column
      Lead.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def sort_direction
      %w[ASC DESC].include?(params[:direction]) ? params[:direction] : "DESC"
    end
end
