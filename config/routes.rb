Rails.application.routes.draw do

  #branchement de la méthode index du fichier events_controller a la page d'acceuil
  root to: 'events#index'
  get 'users/show'
  
  resources :events do 
    resources :attendances
  end 
  resources :orders, only: [:new, :create]
  devise_for :users
  resources :attendances
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
