Rails.application.routes.draw do

  root :to => 'customers#new'


  resources :reports, :only => [:show] do
    member do
      get 'time'
      get 'dimension'
      get 'custom_points'
    end

end



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

    resources :configs do
      resources :custom_points, :only => [:create, :index, :update, :edit] do
      end
    end
  end

  resources :projects, :only => [:new, :create, :index, :edit, :update, :show]


  # login logout
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

end
