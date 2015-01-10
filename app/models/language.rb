class Language < ActiveRecord::Base

	#Validations
	validates :name, :iso, presence: true

	#Methods-----------------------------

	def publish
		update(publish: !published)
	end

	def update
		super if iso != "en"
	end

	def destroy
		super if iso != "en"
	end

	#------------------------------------

end
