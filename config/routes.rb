Rails.application.routes.draw do
  resources :topics do
     get :posts ,to:"posts#show_under_topic"
     resources :posts
  end

  resources :posts
  root "topics#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #get "/show_under_topic" ,to:"posts#show_under_topic",as: "topic_all_posts"
  # Defines the root path route ("/")
  # root "articles#index"
end
