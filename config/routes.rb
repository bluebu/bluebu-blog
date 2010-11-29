Bluebu::Application.routes.draw do
  get "articles/index"

  get "articles/show"

  root :to => "root#index"
  
  resource :account, :controller => 'users' 
  resource :user_session

  namespace :admin do
    root :to => "root#index"
    resources :articles
    resources :categories
  end
  match '/blog', :to => 'articles#index'
  match '/code', :to => 'articles#index'
  match '/me', :to => 'articles#index'
  match ':controller(/:action(/:id(.:format)))'
end
