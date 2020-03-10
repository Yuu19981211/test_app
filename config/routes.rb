Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#home"
  get "about", to: "welcome#about"
  
  resources :articles
  
  get 'signup', to: "users#new"
  resources :users, except:[:new]
  
  get 'login', to: 'session#new'
  get 'login', to: 'session#create'
  delete 'logout', to: 'session#destroy'
end
