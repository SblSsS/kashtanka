class Role < ActiveRecord::Base

	#Associations
	has_many :user_roles, dependent: :destroy
	has_many :users, through: :user_roles

	#Validates
	validates :name, presence: true

	#Methods-----------------------------------------
	#------------------------------------------------

end
