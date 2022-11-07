Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :contestants, only: [:show]
  resources :outings, only: [:show] 
  resources :bachelorettes do 
    resources :contestants, except: [:show] 

  end

end
