class User < ApplicationRecord
	has_secure_password
	has_secure_token

	# associations
	has_many :photos, dependent: :destroy

	# validations
	validates_presence_of :username
	validates_presence_of :email
	# validates_presence_of :password

	def invalidate_token 
		self.update_columns(token: nil)
	end

	def self.valid_login?(email, password)
		user = find_by(email: email)

		if user && user.authenticate(password)
			user
		end
	end
end
