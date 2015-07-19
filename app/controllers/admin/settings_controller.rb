module Admin
	class SettingsController < ResourcesController

		def index
			super
			@settings = @settings.editable
		end

		def update
			params[:config].each do |pair|
				setting = Setting.find_by(name: pair.first)
				if Core.respond_to?("#{pair.first}=") && Core.send("#{pair.first}=", pair.last)
					flash[:notice] 	= t(:update_message, resource: "Settings", scope: :flash)
				else
					flash[:error] 	= t(:setting_error, scope: :flash)
				end
			end

			redirect_to action: :index
		end

	end
end