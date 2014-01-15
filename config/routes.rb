Kidreads::Application.routes.draw do
  resources :users
  resource :session, :only => [:new, :create, :destroy]

  namespace :api, :defaults => {:format => :json } do
    resources :books
    resources :reviews
  end

  root :to => "root#root"
end
