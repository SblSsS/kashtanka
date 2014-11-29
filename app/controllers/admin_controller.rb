class AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :check_access
	layout 'admin'

	protected

	def check_access
		authorize! :manage, :all
	end
end
