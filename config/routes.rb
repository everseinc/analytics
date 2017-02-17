Rails.application.routes.draw do

  root :to => 'customers#new'


  resources :customers, :only => [:new, :create, :show]


end
