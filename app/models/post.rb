class Post < ActiveRecord::Base
	include Resoursable
	include Translatable

	acts_as_translatable :title, :body

	#Associations
	belongs_to :user
	has_one 	 :post_image, as: :viewable, dependent: :destroy

	#Validations
	validates :title, :body, presence: true
	validates :title, uniqueness: true

	accepts_nested_attributes_for :post_image, reject_if: 'attachment.blank?'

	#Methods--------------------------------

	#---------------------------------------


end
