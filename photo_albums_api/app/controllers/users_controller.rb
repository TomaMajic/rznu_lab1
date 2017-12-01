class UsersController < ApplicationController
	before_action :set_user, only: [:show, :update, :destroy]

	# GET /users
	def index
		@users = User.all
		json_response(@users)
	end

	# GET /user/:id
	def show
		json_response(@user)
	end

	# POST /users
	def create
		@user = User.create!(user_params)
		json_response(@user, :created)
	end

	# PUT /users/:id
	def update 
		@user.update(user_params)
		head :ok
	end

	# DELETE /users/:id
	def destroy
		@user.destroy
		head :ok
	end

	def options
		headers['Access-Control-Allow-Origin'] = request.env['HTTP_ORIGIN']
		headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
		headers['Access-Control-Max-Age'] = '1000'
		headers['Access-Control-Allow-Headers'] = '*,x-requested-with'
		head :ok
	end

	def options_single
		headers['Access-Control-Allow-Origin'] = request.env['HTTP_ORIGIN']
		headers['Access-Control-Allow-Methods'] = 'GET, PUT, DELETE, OPTIONS'
		headers['Access-Control-Max-Age'] = '1000'
		headers['Access-Control-Allow-Headers'] = '*,x-requested-with'
		head :ok
	end

	private 

	def user_params
		params.permit(:username, :email, :password)
	end

	def set_user
		@user = User.find(params[:id])
	end
end
