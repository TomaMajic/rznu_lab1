class Photo < ApplicationRecord
	# associations
	belongs_to :user

	# validation
	validates_presence_of :photo_path, :num_likes
end
