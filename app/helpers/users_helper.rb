module UsersHelper

	def submit_title
		case action_name
		when "new"
			"Create my account"
		when "edit"
			"Save changes"
		end
	end

  private
    # Before filters

    def signed_in_user
      store_location
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      fresh_when @user, public: true
      expires_in 5.minutes
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
