Rails.application.routes.draw do

	resources :users do 
		resources :photos
	end
	
	scope :format => true, :constraints => { :format => 'json' } do
	  post   "/login"       => "sessions#create"
	  delete "/logout"      => "sessions#destroy"
	end

	match '/users' => "users#options", via: :options
	# match '/photos' => "users#options", via: :options
	match '*' => "application#undefined_options", via: :options

end
