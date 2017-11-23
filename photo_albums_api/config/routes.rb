Rails.application.routes.draw do

	resources :users do 
		resources :photos
	end
	
	scope :format => true, :constraints => { :format => 'json' } do
	  post   "/login"       => "sessions#create"
	  delete "/logout"      => "sessions#destroy"
	end
end
