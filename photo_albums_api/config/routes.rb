Rails.application.routes.draw do

	resources :users do 
		resources :photos
	end
	
	scope :format => true, :constraints => { :format => 'json' } do
	  post   "/login"       => "sessions#create"
	  delete "/logout"      => "sessions#destroy"
	end

	match '/users' => "users#options", via: :options
	match '/users/:user_id' => "users#options_single", via: :options
	match '/users/:user_id/photos' => "photos#options", via: :options
	match '/users/:user_id/photos/:photo_id' => "photos#options_single", via: :options
	# match '/photos' => "users#options", via: :options
	match '*' => "application#undefined_options", via: :options

end
