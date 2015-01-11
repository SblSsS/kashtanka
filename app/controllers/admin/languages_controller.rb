module Admin
	class LanguagesController < ResourcesController
		
		def index
			super
			@languages = @languages.order(:name)
		end

	end
end