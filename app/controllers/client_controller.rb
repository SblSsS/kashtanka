class ClientController < ApplicationController
	before_action :load_publics

	private

	def load_publics
		@title = Settings.config[:title]
	end
end
