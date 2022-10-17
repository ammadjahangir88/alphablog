Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  root  'welcome#home'
  get 'articles/pdf/:id' , to: 'articles#pdf', as: 'article_pdf'
  get 'welcome', to: 'welcome#about'
<<<<<<< HEAD
  resources :articles
  
  get 'signup', to: 'users#new'

  resources :users, except: [:new]
  resources :comments

=======
 
  
  get 'signup', to: 'users#new'


  resources  :users, except: [:new] do
    resources :articles  do
      resources :comments , only: [:new, :create]
    end
  end
  
  
 
  
  
 
  
>>>>>>> 40b5d358eed49f362d44871baafb3f25321a8c4a
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get '/search' , to: 'articles#search'
  # Defines the root path route ("/")
  # root "articles#index"
<<<<<<< HEAD
=======

  

>>>>>>> 40b5d358eed49f362d44871baafb3f25321a8c4a
end
