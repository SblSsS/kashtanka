module Admin
	class PostsController < ResourcesController
		
		def index
			super
			@posts = @posts.order(created_at: :desc)
		end

	end
end