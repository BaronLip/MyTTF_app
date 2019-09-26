Rails.application.routes.draw do
    resources :opponents, except: [:index]
    resources :games 
    resources :matches
    resources :players
    
    # root to: 'applications#welcome'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
