Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  root  'welcome#home'
  get 'articles/pdf/:id' , to: 'articles#pdf', as: 'article_pdf'
  get 'welcome', to: 'welcome#about'
  resources :articles
  
  get 'signup', to: 'users#new'

  resources :users, except: [:new]
  resources :comments

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get '/search' , to: 'articles#search'
  # Defines the root path route ("/")
  # root "articles#index"
end
