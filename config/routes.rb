Rails.application.routes.draw do
  devise_for :users
  resources :tags
  get 'posts' ,to:"posts#index"
  resources :topics do
     resources :posts do
       resources :comments
     end
  end

  resources :posts do
    resources :comments
    resources :ratings
  end
  root "topics#index"
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
