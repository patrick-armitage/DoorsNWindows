module UsersHelper

	def submit_title
		case action_name
		when "new"
			"Create my account"
		when "edit"
			"Save changes"
		end
	end
end
