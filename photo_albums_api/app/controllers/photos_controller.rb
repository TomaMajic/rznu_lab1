class PhotosController < ApiController
	before_action :set_user
	before_action :set_user_photo, only: [:show, :update, :destroy] 
	before_action :require_login

	# GET /users/:user_id/photos
	def index
		@photos = @user.photos
		json_response(@photos)
	end

	# GET /users/:user_id/photos/:id
	def show
		json_response(@photo)
	end

	# POST /users/:user_id/photos
	def create
		@user.photos.create!(photo_params)
		json_response(@user.photos.last, :created)
	end

	# PUT /users/:user_id/photos/:id
	def update 
		@photo.update(photo_params)
		head :no_content
	end

	# DELETE /users/:user_id/photos/:id
	def destroy
		@photo.destroy
		head :no_content
	end

	private

	def photo_params
		params.permit(:photo_path, :caption, :num_likes)
	end

	def set_user
		@user = User.find(params[:user_id])
	end

	def set_user_photo
		@photo = @user.photos.find_by!(id: params[:id]) if @user
	end
end
