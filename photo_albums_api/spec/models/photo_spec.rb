require 'rails_helper'

RSpec.describe Photo, type: :model do

	# Association test
	# ensure Photo model belongs to a single User
	it { should belong_to(:user) }

	# Validation tests
	# ensure columns photo_path and num_likes are present before saving
	it { should validate_presence_of(:photo_path) }
	it { should validate_presence_of(:num_likes) }
end
