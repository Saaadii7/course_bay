Rails.application.routes.draw do
  	devise_for :users, controllers: {
        registrations: 'users/registrations'
      }


  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	# root to: "home#index"
	
	resources :images, only: [:new, :create, :destroy] do
		collection do
			post 'favourite_toggle' 
		end
	end
	resources :documents, only: [:new, :create, :destroy] do
		collection do
			post 'favourite_toggle' 
		end
	end
	resources :sounds, only: [:new, :create, :destroy] do
		collection do
			post 'favourite_toggle' 
		end
	end
	resources :videos, only: [:new, :create, :destroy] do
		collection do
			post 'favourite_toggle' 
		end
	end
    
    get '/contact', to: 'pages#contact'
    get '/about', to: 'pages#about'

  	devise_scope :user do
	  authenticated :user do
	    root 'pages#index', as: :authenticated_root
	  end

	  unauthenticated do
	    root 'devise/sessions#new', as: :unauthenticated_root
	  end
	end
	
end
