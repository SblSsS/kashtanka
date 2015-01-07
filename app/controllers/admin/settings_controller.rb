module Admin
	class SettingsController < ResourcesController

		def update
			params[:config].each do |pair|
				setting = Setting.find_by(name: pair.first)
				if setting && setting.update_attributes(value: pair.last)
					flash[:notice] 	= t(:update_message, resource: "Settings", scope: :flash)
				else
					flash[:error] 	= t(:setting_error, scope: :flash)
				end
			end

			redirect_to action: :index
		end

	end
end