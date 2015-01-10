class Language < ActiveRecord::Base

	#Validations
	validates :name, :iso, presence: true

	#Methods-----------------------------

	def destroy
		super if iso != "en"
	end

	#------------------------------------

end
