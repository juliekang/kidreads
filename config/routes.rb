Kidreads::Application.routes.draw do
  root :to => "root#root"

  resources :users
  resource :session, :only => [:new, :create, :destroy]

  namespace :kr, :defaults => {:format => :json } do
    resources :books, :only => [:index, :create, :show]
    resources :reviews
    resources :clubs
    resources :club_memberships, :only => [:index, :create, :destroy]
    resources :book_statuses, :only => [:index, :create, :update, :destroy]
    resources :activity_streams, :path => "streams", :as => "streams", :only => [:index, :create]
  end

  get "search/query"
end
