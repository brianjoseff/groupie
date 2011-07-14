Groupie::Application.routes.draw do

match '/signup', :to => 'users#new'
root :to => 'pages#home'
end
