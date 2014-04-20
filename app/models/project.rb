class Project < ActiveRecord::Base

	# Relationships
	
	belongs_to :user

	# Validations

	validates :user_id, presence: true

end
