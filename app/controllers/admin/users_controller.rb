class Admin::UsersController < Admin::ResourcesController

	def update
		if params[:user][:password].blank? || params[:user][:password_confirmation].blank?
			params[:user].delete(:password)
			params[:user].delete(:password_confirmation)
		end

		super
	end

	private

	def resource_params
		params.require(:user).permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation)
	end

end
