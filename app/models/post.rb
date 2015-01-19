class Post < ActiveRecord::Base
	include Resoursable
	include Translatable
  extend  FriendlyId

  friendly_id :title, use: :slugged
	acts_as_translatable :title, :body
	acts_as_taggable

	#Associations
	belongs_to :user
	has_one 	 :post_image, as: :viewable, dependent: :destroy

	#Validations
	validates :title, :body, presence: true
	validates :title, uniqueness: true

	accepts_nested_attributes_for :post_image, reject_if: :image_invalid?

	#Methods--------------------------------

	def tag_ids=(ids)
		self.tag_list = ids.select {|id| id if !id.blank?}.join(',')
	end

	private

		def image_invalid? attributed
			attributed[:attachment].blank?
		end

	#---------------------------------------


end
