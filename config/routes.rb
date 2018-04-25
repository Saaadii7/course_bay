Rails.application.routes.draw do
  	devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
	
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
    get '/pay', to: 'pages#pay'

    post '/card_pay', to: 'stripe#card_pay'
    post '/send_email', to: 'email#send_email'


  	devise_scope :user do
	  authenticated :user do
	    root 'pages#index', as: :authenticated_root
	  end

	  unauthenticated do
	    root 'pages#home', as: :unauthenticated_root
	    # root 'devise/sessions#new', as: :unauthenticated_root
	  end
	end
	
end
