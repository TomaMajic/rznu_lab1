module ExceptionHandler
	extend ActiveSupport::Concern

	included do 
		# Catch it from set_user if user not found
		rescue_from ActiveRecord::RecordNotFound do |e|
			json_response({ message: e.message}, :not_found)
		end

		# Catch it from create! if data invalid
		rescue_from ActiveRecord::RecordInvalid do |e|
		  json_response({ message: e.message }, :unprocessable_entity)
		end
	end
end