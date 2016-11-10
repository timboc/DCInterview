Rails.application.routes.draw do
  resources :products
  resources :categories
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'categories#index'

  get 'start' => 'start#index'
  post 'start/import' => 'start#import'

end
