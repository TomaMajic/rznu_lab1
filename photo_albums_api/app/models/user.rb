class User < ApplicationRecord
	# associations
	has_many :photos, dependent: :destroy

	# validations
	validates_presence_of :username
end
