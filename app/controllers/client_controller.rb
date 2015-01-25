class ClientController < ApplicationController
	before_action :load_publics
  before_action :enabled?

	private

	def load_publics
		@title = Settings.config[:title]
	end

  def enabled?
    if !Settings.config[:enabled]
      redirect_to client_disabled_path
    end
  end
end
