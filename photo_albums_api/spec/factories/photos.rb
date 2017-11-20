FactoryGirl.define do 
	factory :photo do 
		photo_path { Faker::Lorem.word }
		num_likes 0
		caption ''
		user_id nil
	end
end