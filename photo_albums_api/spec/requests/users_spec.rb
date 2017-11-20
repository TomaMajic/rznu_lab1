require 'rails_helper'

RSpec.describe 'Photo Albums API', type: :request do
	# Initialize test data
	let!(:users) { create_list(:user, 10) }
	let(:user_id) { users.first.id }

	# Test for GET /users
	describe 'GET /users' do 
		# Make a HTTP get request before each example
		before { get '/users' }

		it 'returns users' do 
			expect(json).not_to be_empty
			expect(json).to eq(10)
		end

		it 'returns status code 200' do 
			expect(response).to have_http_status(200)
		end
	end

	# Test for GET /users/:id
	describe 'GET /users/:id' do 
		before { get "/users/#{user_id}" }

		context 'when the record exists' do
			it 'returns the user' do 
				expect(json).not_to be_empty
				expect(json['id']).to eq(user_id)
			end

			it 'returns status code 200' do 
				expect(response).to have_http_status(200)
			end
		end

		context 'when the record does not exist' do
			let(:user_id) { 100 }

			it 'returns status code 404' do
				expect(response).to have_http_status(404)
			end

			it 'returns a not found message' do
				expect(response.body).to match(/Couldn't find User/i)
			end
		end
	end

	# Test for POST /users
	describe 'POST /users' do
		# Valid attributes to create
		let(:valid_attributes) { { username: 'TomaM7' } }

		context 'when the request is valid' do
			before { post '/users', params: valid_attributes }

			it 'creates a user' do
				expect(json['username']).to eq('TomaM7')
			end

			# Created
			it 'returns status code 201' do
				expect(response).to have_http_status(201)
			end
		end

		context 'when the request is not valid' do 
			before { post '/users', params: {} }

			# Unprocessable entity
			it 'returns status code 422' do 
				expect(response).to have_http_status(422)
			end

			it 'returns a validation failure message' do
				expect(response.body).to match(/Validation failed/)
			end
		end
	end

	# Test for PUT /users/:id
	describe 'PUT /users/:id' do 
		let(:valid_attributes) { { username: 'TomaMajic' } }

		context 'when the record exists' do
			before { put "/users/#{user_id}", params: valid_attributes }

			it 'updates the record' do
				expect(response.body).to be_empty
			end

			it 'returns status code 204' do
				expect(response).to have_http_status(204)
			end
		end
	end

	# Test for DELETE /users/:id
	describe 'DELETE /users/:id' do
		before { delete "/users/#{user_id}" }

		it 'returns status code 204' do
			expect(response).to have_http_status(204)
		end
	end
end