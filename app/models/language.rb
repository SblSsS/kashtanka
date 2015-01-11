class Language < ActiveRecord::Base

	#Validations
	validates :name, :iso, presence: true
	validates :iso, uniqueness: true

	#Methods-----------------------------

	def publish
		update(published: !published) if iso != "en"
	end

	def destroy
		super if iso != "en"
	end

	#------------------------------------

end
