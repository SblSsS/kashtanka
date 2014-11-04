class Translation < ActiveRecord::Base
	
	#Associations
	belongs_to :translatable, polymorphic: true

	#Validations
	validates :locale, :field_translation, :field_name, presence: true
	validates :locale, length: {is: 2}
	validates :field_name, uniqueness: { scope: [:translatable_id, :locale] }

end
