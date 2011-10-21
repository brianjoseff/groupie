Groupie::Application.routes.draw do
  resources :emails

  get "memberships/index"

  get "memberships/update"
  
  
  resources :posts
  resources :users do
    resources :posts
  end
  resources :emails
  resources :posts do
    resources :emails
  end
  
  namespace :admin do 
    resources :users
  end
  resources :groups
  resources :sessions, :only => [:new, :create, :destroy]
  resources :memberships
  
  match '/signout', :to => 'sessions#destroy'
  match '/signin', :to => 'sessions#new'
  match '/signup', :to => 'users#new'
  match '/about', :to => 'home#about'
  match '/contact', :to => 'home#contact'
  
  root :to => 'home#index'
end
