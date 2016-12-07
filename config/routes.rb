Rails.application.routes.draw do

  root :to => 'test#index'


  resources :customers, :only => [:new, :create]


end
