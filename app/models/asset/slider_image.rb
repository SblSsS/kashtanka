class SliderImage < Asset
	include Resoursable

	has_attached_file :attachment, styles: {thumb: "100x100#", slide: "800x600^"}

end