Rails.application.routes.draw do

  root :to => 'customers#new'

  get "reports/main/:project_id", to: "reports#main"
  get "reports/load", to: "reports#load"



  resources :customers, :only => [:new, :create, :edit, :update, :show] do
  	member do
  		patch 'update_passwd'
  	end

    collection do
      post 'invite'
    end
  end

  resources :apps, :only => [:new, :create, :edit, :update, :index, :show] do
    collection do
      get 'join'
    end
  end

  resources :projects, :only => [:new, :create, :index, :edit, :update, :show]


  # login logout
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

end
