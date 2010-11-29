Bluebu::Application.routes.draw do
  get "me/index"

  root :to => "root#index"
  
  resources :articles
  resources :account, :controller => 'users' 
  resources :user_session
  
  namespace :admin do
    root :to => "root#index"
    resources :articles
    resources :categories
  end
  match '/blog', :to => 'articles#index'
  match '/code', :to => 'articles#index'
  match ':controller(/:action(/:id(.:format)))'
end
