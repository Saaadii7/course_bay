Rails.application.routes.draw do
  	devise_for :users, controllers: {
        registrations: 'users/registrations'
      }


  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	# root to: "home#index"
	
	resources :images, only: [:new, :create, :destroy]
	resources :videos, only: [:new, :create, :destroy]
	resources :documents, only: [:new, :create, :destroy]
	resources :sounds, only: [:new, :create, :destroy]
    

    post '/images/favourite_toggle', to: 'images#favourite_toggle'
    post '/videos/favourite_toggle', to: 'videos#favourite_toggle'
    post '/documents/favourite_toggle', to: 'documents#favourite_toggle'
    post '/sounds/favourite_toggle', to: 'sounds#favourite_toggle'


  	devise_scope :user do
	  authenticated :user do
	    root 'pages#index', as: :authenticated_root
	  end

	  unauthenticated do
	    root 'devise/sessions#new', as: :unauthenticated_root
	  end
	end
	
end
