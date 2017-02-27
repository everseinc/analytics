Rails.application.routes.draw do

  root :to => 'customers#new'

  get "reports/main/:project_id", to: "reports#main"



  resources :customers, :only => [:new, :create, :show]
  resources :apps, :only => [:new, :create, :index, :show]
  resources :projects, :only => [:new, :create, :index, :show]


  # login logout
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

end
