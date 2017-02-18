Rails.application.routes.draw do

  root :to => 'customers#new'

  get "reports/test", to: "reports#main"


  resources :customers, :only => [:new, :create, :show]


end
