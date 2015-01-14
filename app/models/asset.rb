class Asset < ActiveRecord::Base

	#Associations
	belongs_to :viewable, polymorphic: true

	#Paperclip
	has_attached_file :attachment, styles: {thumb: "100x100#"}

	#Validations
	validates_attachment_presence :attachment
	validates_attachment_content_type :attachment,
																		content_type: ['image/png','image/jpeg','image/jpg']

	#Methods------------------------------------

	#-------------------------------------------

end
