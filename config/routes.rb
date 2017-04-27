Rails.application.routes.draw do

  root :to => 'tops#top'

  resources :reports, :only => [:show] do
    member do
      get 'time'
      get 'dimension'
      get 'key'
      get 'custom_points'

      scope module: :reports do
        resources :dimensions, :only => [:index, :destroy, :show] do
          
        end
      end
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
      resources :custom_points, :only => [:create, :index, :update, :destroy] do
      end
    end
  end

  resources :projects, :only => [:new, :create, :index, :edit, :update, :show]

  # login logout
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get 'logout'  => 'sessions#destroy'
  delete 'logout'  => 'sessions#destroy'



  # API用
  namespace :api, {format: 'json'} do
    namespace :v1 do
      namespace :emos do
        match :/, :action => "push", via: [:get, :post]
      end
    end
  end
end