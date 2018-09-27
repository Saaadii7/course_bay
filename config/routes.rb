Rails.application.routes.draw do
  	devise_for :users, controllers: {
        registrations: 'users/registrations'
      }, path: '',path_names: { sign_up: 'sign_up', sign_in: 'sign_in'}

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
	resources :services, only: [:new, :create, :destroy] do
		collection do
		end
	end
	# resources :pages, only: [] do
	# 	collection do
	# 		get 'contact'
	# 		get 'index'
	# 		get 'about'
	# 		get 'pay'
	# 		get 'therapist'
	# 		get 'galleryWithGrid'
	# 		get 'galleryWithOutGrid'
	# 	end
	# end

    get '/contact',         to: 'pages#contact'
    get '/about',           to: 'pages#about'
    get '/pay',             to: 'pages#pay'
    get '/index',           to: 'pages#index'
    get '/dashboard',       to: 'pages#dashboard'
    get '/home',            to: 'pages#home'
    get '/adminpanel',      to: 'pages#adminpanel'
    get '/users',           to: 'pages#users'
    get '/therapists',      to: 'pages#therapists'
    get '/galleryWithGrid', to: 'pages#galleryWithGrid'
    get '/galleryWithOutGrid', to: 'pages#galleryWithOutGrid'

    post '/card_pay', to: 'stripe#card_pay'
    post '/send_email', to: 'email#send_email'

  	devise_scope :user do
  	  authenticated :user do
  	    root 'pages#dashboard', as: :authenticated_root
  	  end
  	  unauthenticated do
  	    root 'pages#home', as: :unauthenticated_root
  	    # root 'devise/sessions#new', as: :unauthenticated_root
  	  end
    end
    resources :posts
    resources :categories do
    	member do
    		get 'get_sub_categories' 
    	end
    end
    resources :sub_categories
    resources :brands
    resources :types
    resources :tags

end
