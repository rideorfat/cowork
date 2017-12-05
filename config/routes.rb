Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  resources :articles

#-----------admin後台--------------
  namespace :admin do
    resources :articles do
      member do
        patch :move_up
        patch :move_down        
        post :publish
        post :hide
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
