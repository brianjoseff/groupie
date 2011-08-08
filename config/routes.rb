Groupie::Application.routes.draw do
  resources :posts
  resources :users
  resources :groups
  resources :sessions, :only => [:new, :create, :destroy]
  
  match '/signout', :to => 'sessions#destroy'
  match '/signin', :to => 'sessions#new'
  match '/signup', :to => 'users#new'
  match '/about', :to => 'home#about'
  match '/contact', :to => 'home#contact'
  
  root :to => 'home#index'
end
