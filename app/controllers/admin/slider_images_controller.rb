module Admin
	class SliderImagesController < ResourcesController

		private

			def resource_params
				params.require(:slider_image).permit(:attachment, :alt, :published, :position)
			end

	end
end