class UsersController < ApplicationController

	skip_before_action :require_agreement

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if @user.update(user_params)
			redirect_to users_edit_path, notice: I18n.t("updated")
		else
			p @user
			render :edit
		end
	end

	private

		def user_params
			params.require(:user).permit(:family_name, :given_name, :country, :tel, :zipcode, :address, :agreement)
		end
end
