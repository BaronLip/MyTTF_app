Rails.application.routes.draw do
    
    resources :opponents, except: [:index]
    resources :games 
    resources :matches
    resources :players, except: [:index]
    resources :sessions, only: [:new, :create, :destroy]    

    root to: 'application#welcome'
    get 'signup', to: 'players#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
