class ApplicationController < ActionController::Base

	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	# before_action :authenticate_user!
	before_action :require_agreement

	skip_before_action :require_agreement, only: [:edit, :destroy]

	private

		def require_agreement
			if user_signed_in? && current_user.agreement != true
				redirect_to users_edit_path
			end
		end

end
