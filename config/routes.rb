Rails.application.routes.draw do
  get 'pages/home'
  # get 'ajax/:action', to: 'ajax#:action', :defaults => { :format => 'js' }
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :tags
  get 'posts' ,to:"posts#index"
  resources :topics do
     resources :posts do
       resources :comments
     end
     post "posts/:post_id/read/:user_id", to:'posts#read'
     patch "posts/:post_id/status/:user_id", to:'posts#status'
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
