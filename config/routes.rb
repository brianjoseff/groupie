Groupie::Application.routes.draw do
  resources :emails

  get "memberships/index"

  get "memberships/update"
  
  resources :users do
    resources :posts
    resources :groups
  end
  resources :groups
 # match '/search', :to => 'posts#search', :action => "search"
  resources :emails
  resources :posts do
    resources :emails
  end
  
  namespace :admin do 
    resources :users
  end
  resources :sessions, :only => [:new, :create, :destroy]
  resources :memberships
  resources :search, :only => [:index]
  resources :messages, :only => [:new]
  
  match '/signout', :to => 'sessions#destroy'
  match '/signin', :to => 'sessions#new'
  match '/signup', :to => 'users#new'
  match '/about', :to => 'home#about'
  match '/contact', :to => 'home#contact'
  
  root :to => 'home#index'
end
