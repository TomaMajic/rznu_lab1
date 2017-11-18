require 'rails_helper'

RSpec.describe User, type: :model do
  
  # Association test
  # ensure User model has 1:N relationship with Photo
  it { should have_many(:photos).dependent(:destroy) }

  # Validation tests
  # ensure username is present before saving
  it { should validate_presence_of(:username) }
end
