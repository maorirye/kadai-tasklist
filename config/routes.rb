Rails.application.routes.draw do
  get 'toppages/index'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

 root to: 'toppages#index'
 
 get 'logged_in', to: 'sessions#new'
 post 'login', to:'sessions#create'
 delete 'logout', to:'sessions#destroy'
 
 get 'signup', to: 'users#new'
 resources :users, only: [:index, :show, :new, :create]
end
