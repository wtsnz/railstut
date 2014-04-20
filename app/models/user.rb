class User < ActiveRecord::Base

	# Relationships
	has_many :projects

	# Hooks

	before_save { self.email = email.downcase }
	before_create :create_remember_token


	# Validations

	validates :name,  presence: true, length: { maximum: 50 }
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }


	# Class Functions

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end


	# Private Functions

	private
		def create_remember_token
			self.remember_token = User.digest(User.new_remember_token)
		end

end
