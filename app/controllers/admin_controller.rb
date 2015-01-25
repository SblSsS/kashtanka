class AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :check_access
	before_action :load_publics
	layout 'admin'

	protected

	def check_access
		authorize! :manage, :all
	end

	def load_publics
		@title = Settings.config[:title]
	end

	def set_language
		I18n.locale = I18n.default_locale
	end
end
