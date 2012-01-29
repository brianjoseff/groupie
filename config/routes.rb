Groupie::Application.routes.draw do

  resources :emails
  
  get "memberships/index"

  get "memberships/update"

  resources :users do
    resources :posts
    resources :groups
  end
  
  resources :groups 
  
  resources :posts do
    resources :emails
  end
  
  namespace :admin do 
    resources :users
  end
  
  resources :product_categories, :subcategories
  
  resources :sessions, :only => [:new, :create, :destroy]
  resources :memberships
  resources :search, :only => [:index]
  resources :messages, :only => [:new]
  
  match '/search', :to => 'search#index'
  match '/invites', :to => 'invites#new'
  match '/messages', :to => 'messages#new'
  match '/signout', :to => 'sessions#destroy'
  match '/signin', :to => 'sessions#new'
  match '/signup', :to => 'users#new'
  match '/about', :to => 'home#about'
  match '/contact', :to => 'home#contact'
  
  root :to => 'home#index'
end
