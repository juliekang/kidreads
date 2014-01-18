Kidreads::Application.routes.draw do
  root :to => "root#root"

  resources :users
  resource :session, :only => [:new, :create, :destroy]

  namespace :kr, :defaults => {:format => :json } do
    resources :books
    resources :reviews
    resources :clubs
    resources :book_statuses
  end

  get "search/query"
end
