class ClientController < ApplicationController
	before_action :load_publics
  before_action :enabled?

	private

	def load_publics
		@title = Core.title
	end

  def enabled?
    if !Core.enabled
      redirect_to client_disabled_path
    end
  end
end
