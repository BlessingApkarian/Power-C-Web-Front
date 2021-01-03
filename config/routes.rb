Rails.application.routes.draw do
  get 'welcome/index'
  
  get '/filecontents/:id', to: "articles#read"
  
  resources :articles
  
  root 'welcome#index'
end
