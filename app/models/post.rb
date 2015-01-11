class Post < ActiveRecord::Base

	#Associations
	belongs_to :user

	#Validations
	validates :title, :body, presence: true
	validates :title, uniqueness: true

	#Methods--------------------------------
	
	#---------------------------------------


end
