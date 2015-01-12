class Post < ActiveRecord::Base
	include Resoursable
	include Translatable

	acts_as_translatable :title, :body

	#Associations
	belongs_to :user

	#Validations
	validates :title, :body, presence: true
	validates :title, uniqueness: true

	#Methods--------------------------------

	#---------------------------------------


end
