Rails.application.routes.draw do
    
    resources :players, only: [:show] do
        resources :matches, only: [:new, :create, :edit, :update, :destroy]        
    end

    resources :players, except: [:index] 
    resources :matches
    resources :opponents, except: [:index]
    resources :games 
    resources :sessions, only: [:new, :create, :destroy]


    root to: 'application#welcome'
    get 'signup', to: 'players#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
