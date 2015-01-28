class SliderImage < Asset
	include Resoursable

	#Associations
	has_attached_file :attachment, styles: {thumb: "100x100#", slide: "800x600^"}

	#Scopes
	scope :slider, -> (name) { where(name: name) }

	#Callbacks
	before_create :set_position
	after_destroy	:reorder

	#Methods-------------------------------------

	private

		def set_position
			last_position = SliderImage.count > 0 ? SliderImage.all.order(:position).last.position : 0
			self.position = last_position + 1
		end

		def reorder
			SliderImage.all.order(:position).each_with_index do |index, image|
				image.update(position: index+1)
			end
		end

	#--------------------------------------------

end