class UserRole < ActiveRecord::Base

	#Linking table for Roles and Users

	#Associations
	belongs_to :user
	belongs_to :role

	#Validations
	validates_uniqueness_of :role_id, scope: [:user_id]

end
