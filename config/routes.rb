Groupie::Application.routes.draw do

resources :users
resources :sessions, :only => [:new, :create, :destroy]

match '/signup', :to => 'users#new'
match '/about', :to => 'pages#about'
match '/contact', :to => 'pages#contact'

root :to => 'pages#home'
end
