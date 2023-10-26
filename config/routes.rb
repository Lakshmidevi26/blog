Rails.application.routes.draw do
  root "topics#index"
  devise_for :users, controllers: {
    registrations: 'user/registrations'
  }
  resources :tags
  get 'posts' ,to:"posts#index"

  resources :topics do
     resources :posts do
       resources :comments do
          resources :user_comment_ratings
       end
      #  resources :ratings
     end
     post "posts/:post_id/read/:user_id", to:'posts#read'
     patch "posts/:post_id/status/:user_id", to:'posts#status'
  end

  resources :posts do
    # resources :comments
    resources :ratings
  end
  
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
