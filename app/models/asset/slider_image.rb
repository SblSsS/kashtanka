class SliderImage < Asset
	include Resoursable

	acts_as_list

	#Associations
	has_attached_file :attachment, styles: {thumb: "100x100#", slide: "800x600^"}

	#Scopes
	default_scope { order(:position) }
	scope :slider, -> (name) { where(name: name) }

	#Callbacks

	#Methods-------------------------------------


	#--------------------------------------------

end