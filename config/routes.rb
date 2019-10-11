Rails.application.routes.draw do
    
    resources :players, only: [:show] do
        resources :matches, except: [:index]        
    end

    resources :players, except: [:index] 
    resources :opponents, only: [:new, :create, :edit, :update]
    resources :matches, except: [:index, :new]
    resources :sessions, only: [:new, :create, :destroy]
    # resources :games 


    root to: 'application#welcome'
    get 'signup', to: 'players#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    get '/auth/:provider/callback', to: 'sessions#create'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
