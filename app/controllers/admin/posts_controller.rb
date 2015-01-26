module Admin
	class PostsController < ResourcesController
		
		def index
			super
			@posts = @posts.order('posts.created_at DESC')
		end

		private

			def filter_params
				params.slice(:by_title, :by_tags, :by_published, :by_date)
			end

			def resource_params
				params.require(:post).permit(:title, :body, :published, :tags, :slug, 
																		 post_image_attributes: [:id, :attachment],
																		 translations_attributes: [:id,:field_name,:locale,:field_translation])
			end

	end
end